-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- LocalsToTable.lua
--
-- This Script provides a Obfuscation Step for converting Local Variables to a table access
-- This Step can and often will cause garbage collection Problems
local Step = require("prometheus.step");
local Ast = require("prometheus.ast");
local Scope = require("prometheus.scope");
local visitAst = require("prometheus.visitast");
local util = require("prometheus.util");
local logger = require("logger")

local AstKind = Ast.AstKind;

local LocalsToTable = Step:extend();
LocalsToTable.Description = "This Step will wrap all Locals in each scope into a table";
LocalsToTable.Name = "Locals to Table";

LocalsToTable.SettingsDescriptor = {
	Treshold = {
		name = "Treshold",
		description = "The relative amount of scopes that will be affected",
		type = "number",
		default = 1,
		min = 0,
		max = 1,
	},
	RemapIndices = {
		name = "RemapIndices",
		description = "When this option is set to true, new table indices will be generated instead of using the id's generated by the parser",
		type = "boolean",
		default = true,
	}
}

function LocalsToTable:init(settings)
	logger:warn(string.format("The Step \"%s\" is not recommended, as it causes Memory Leaks", LocalsToTable.Name))
end

function LocalsToTable:apply(ast)
	visitAst(ast, function(node, data)
		if(node.kind == AstKind.ForStatement) then
			data.specialScopeType = "for";
			data.var = node.id;
		end
		
		if(node.kind == AstKind.ForInStatement) then
			data.specialScopeType = "forin";
			data.vars = node.ids;
		end
		
		if(node.kind == AstKind.FunctionDeclaration or node.kind == AstKind.LocalFunctionDeclaration or node.kind == AstKind.FunctionLiteralExpression) then
			data.specialScopeType = "function";
			data.args = node.args;
		end
		
		-- Previsit Function
		if(node.kind == AstKind.Block) then
			local blockData = data.blockData;
			local apply = math.random() < self.Treshold;
			blockData.apply = apply;
			if apply then
				local scope = data.scope;
				local tableId = scope:addVariable();
				
				local varmap = {};
				for i = 1, scope:getMaxId(), 1 do
					table.insert(varmap, i)
				end
				
				if(self.RemapIndices) then
					util.shuffle(varmap);
				end
				
				local info = {
					scope = scope,
					apply = apply,
					tableId = tableId,
					varmap = varmap;
					used = false,
				};
				
				data.info[scope] = info;
				
				data.currentImmutables = nil;
				blockData.specialScopeType = data.specialScopeType;
				blockData.var = data.var;
				blockData.vars = data.vars;
				blockData.args = data.args;
				blockData.info = info;
				data.specialScopeType = nil;
			end
		end
	end, function(node, data)
		-- Postvisit Function
		local snode;
		
		
		-- Variable Expressions
		if(node.kind == AstKind.VariableExpression) then
			if not node.scope.isGlobal then
				if data.info[node.scope] and data.info[node.scope].apply then
					local info = data.info[node.scope];
					info.used = true;
					
					data.scope:removeReferenceToHigherScope(node.scope, node.id, 1);
					data.scope:addReferenceToHigherScope(info.scope, info.tableId, 1);
					
					local tid = info.varmap[node.id] or node.id;
					
					return Ast.IndexExpression(
						Ast.VariableExpression(info.scope, info.tableId),
						Ast.NumberExpression(tid)
					);
				end
			end
		
		-- Local Variable Declarations
		elseif(node.kind == AstKind.LocalVariableDeclaration) then
			if not node.scope.isGlobal then
				if data.info[node.scope] and data.info[node.scope].apply then
					local expressions = node.expressions;
					local primaryExpressions = {};
					local info = data.info[node.scope];
					info.used = true;
					
					for _, id in ipairs(node.ids) do
						node.scope:removeReference(id);
						data.scope:addReferenceToHigherScope(info.scope, info.tableId, 1);
						
						local tid = info.varmap[id] or id;
						
						table.insert(primaryExpressions, Ast.AssignmentIndexing(
							Ast.VariableExpression(info.scope, info.tableId),
							Ast.NumberExpression(tid)
						));
					end

					if (#expressions > 0) then
						snode = Ast.AssignmentStatement(primaryExpressions, expressions);
					else
						snode = Ast.NopStatement();
					end
				end
			end
		
		-- Local Function Declaration
		elseif(node.kind == AstKind.LocalFunctionDeclaration) then
			if not node.scope.isGlobal then
				if data.info[node.scope] and data.info[node.scope].apply then
					local info = data.info[node.scope];
					info.used = true;
					local id = node.id;
					
					info.scope:removeReference(id);
					data.scope:addReferenceToHigherScope(info.scope, info.tableId, 1);
					
					local tid = info.varmap[id] or id;
					
					snode = Ast.AssignmentStatement({
						Ast.IndexExpression(
							Ast.VariableExpression(info.scope, info.tableId),
							Ast.NumberExpression(tid)
						);
					}, {
						Ast.FunctionLiteralExpression(node.args, node.body)
					});
				end
			end
		
		-- Function Declaration
		elseif(node.kind == AstKind.FunctionDeclaration) then
			if not node.scope.isGlobal then
				if data.info[node.scope] and data.info[node.scope].apply then
					local id = node.id;
					local literal = Ast.FunctionLiteralExpression(node.args, node.body);
					
					local info = data.info[node.scope];
					info.used = true;
					info.scope:removeReference(id);
					data.scope:addReferenceToHigherScope(info.scope, info.tableId, 1);
					
					local tid = info.varmap[id] or id;
					
					local primaryExpr = Ast.IndexExpression(
						Ast.VariableExpression(info.scope, info.tableId),
						Ast.NumberExpression(tid)
					);
					
					for _, idx in ipairs(node.indices) do
						primaryExpr = Ast.IndexExpression(
							primaryExpr,
							Ast.StringExpression(idx)
						);
					end
					
					primaryExpr.kind = AstKind.AssignmentIndexing;
					snode = Ast.AssignmentStatement({primaryExpr},{literal});
				end
			end

		-- Assignment Variable
		elseif(node.kind == AstKind.AssignmentVariable) then
			if not node.scope.isGlobal then
				if data.info[node.scope] and data.info[node.scope].apply then
					local info = data.info[node.scope];
					info.used = true;

					data.scope:removeReferenceToHigherScope(node.scope, node.id, 1);
					data.scope:addReferenceToHigherScope(info.scope, info.tableId, 1);
					
					local id = node.id;
					local tid = info.varmap[id] or id;

					return Ast.AssignmentIndexing(
						Ast.VariableExpression(info.scope, info.tableId),
						Ast.NumberExpression(tid)
					);
				end
			end

		-- Block
		elseif(node.kind == AstKind.Block) then
			local scope = node.scope;
			if data.info[scope] and data.info[scope].apply and data.info[scope].used then 
				local info = data.info[scope];
				table.insert(node.statements, 1, Ast.LocalVariableDeclaration(scope, {info.tableId}, {Ast.TableConstructorExpression({})}));
				if(data.blockData.specialScopeType == "for") then
					local id = data.blockData.var;
					local tid = info.varmap[id] or id;
					
					table.insert(node.statements, 2, Ast.AssignmentStatement(
						{Ast.AssignmentIndexing(
							Ast.VariableExpression(info.scope, info.tableId),
							Ast.NumberExpression(tid)
							)
						}, {
							Ast.VariableExpression(scope, id);
						}
					));
				end
				if(data.blockData.specialScopeType == "forin") then
					local tableIndexings = {};
					local variableExpressions = {};
					
					for i, id in ipairs(data.blockData.vars) do
						local tid = info.varmap[id] or id;
						
						table.insert(tableIndexings, Ast.AssignmentIndexing(
							Ast.VariableExpression(info.scope, info.tableId),
							Ast.NumberExpression(tid)
							));
						table.insert(variableExpressions, Ast.VariableExpression(scope, id));
					end
					
					table.insert(node.statements, 2, Ast.AssignmentStatement(tableIndexings, variableExpressions));
				end
				if(data.blockData.specialScopeType == "function") then
					local tableIndexings = {};
					local variableExpressions = {};
					local d = false;

					for i, arg in ipairs(data.blockData.args) do
						if(arg.kind ~= AstKind.VarargExpression) then
							local id = arg.id;
							local tid = info.varmap[id] or id;
							d = true;
							table.insert(tableIndexings, Ast.AssignmentIndexing(
								Ast.VariableExpression(info.scope, info.tableId),
								Ast.NumberExpression(tid)
								));
							table.insert(variableExpressions, Ast.VariableExpression(scope, id));
						end
					end
					if d then
						table.insert(node.statements, 2, Ast.AssignmentStatement(tableIndexings, variableExpressions));
					end
				end
			end
		end
		
		return snode;
		
	end, {info = {}});
end

return LocalsToTable;