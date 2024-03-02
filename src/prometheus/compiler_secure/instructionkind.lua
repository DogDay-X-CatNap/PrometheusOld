return {
	LOADCONST = "LOADCONST",
	GETGLOBAL = "GETGLOBAL",
	SETGLOBAL = "SETGLOBAL",
	ASSIGNGLOBAL = "ASSIGNGLOBAL",
	GETLOCAL  = "GETLOCAL",
	SETLOCAL = "SETLOCAL",
	ASSIGNLOCAL = "ASSIGNLOCAL",
	LOADNIL  = "LOADNIL",
	LOADTRUE = "LOADTRUE",
	LOADFALSE = "LOADFALSE",
	JMPC     = "JMPC",
	JMP      = "JMP",
	ADD      = "ADD",
	SUB      = "SUB",
	MOD      = "MOD",
	POW      = "POW",
	NEG      = "NEG",
	CONCAT   = "CONCAT",
	MUL      = "MUL",
	DIV      = "DIV",
	EQ       = "EQ",
	NEQ      = "NEQ",
	NOT      = "NOT",
	LEN      = "LEN",
	LT       = "LT",
	GT       = "GT",
	GET      = "GET",
	LET      = "LET",
	DUP      = "DUP",
	FORSKIP  = "FORSKIP",
	FORINSKIP = "FORINSKIP",
	FORPREP  = "FORPREP",
	NEWTABLE = "NEWTABLE",
	GETTABLE = "GETTABLE", -- TB, Index -> TB, Value
	GETTABLE2 = "GETTABLE2", -- TB, Index -> Value
	POPTABLESTART = "POPTABLESTART",
	SETTABLE = "SETTABLE", -- TB, Index, Value -> TB
	SETTABLE2 = "SETTABLE2",
	SETTABLE3 = "SETTABLE3",
	ASSIGNTABLE = "ASSIGNTABLE",
	LOADARGS = "LOADARGS", -- ... -> ..., args
	LOADARG  = "LOADARG", -- Load a single arg instead of the arg table
	SETARGS  = "SETARGS",  -- ..., args -> ...
	SWAP     = "SWAP",     -- a, b -> b, a
	PUSHTEMPSTACK = "PUSHTEMPSTACK",
	PUSHTEMPSTACK2 = "PUSHTEMPSTACK2",  -- copies the last value of the current stack to the temp stack
	POPTEMPSTACK  = "POPTEMPSTACK",
	POPTEMPSTACK2 = "POPTEMPSTACK2", -- Does not keep one value of the temp stack
	UNPACK   = "UNPACK", -- Unpacks a table and pushes all values to the current stack
	PACK     = "PACK", -- Creates a table containing every entry on the current stack
	UNPACKFIRST = "UNPACKFIRST", -- Gets the first element of a table
	RET      = "RET",
	RET2     = "RET2", -- Returns only a single value
	RET3     = "RET3", -- Returns no value
	DROP     = "DROP",
	FUNC     = "FUNC",
	CALL     = "CALL",
	CALLPS   = "CALLPS",
	NOP      = "NOP",
	CLEARSTACK = "CLEARSTACK", -- Clears the Entire Stack
	PUSHSCOPE = "PUSHSCOPE", -- Create a new Local Scope
	POPSCOPE  = "POPSCOPE", -- Pop the uppermost Local scope (the parent scope becomes the new local scope)
    CRASH    = "CRASH", -- Special Instruction to Crash the Vm using a while true do end loop
};