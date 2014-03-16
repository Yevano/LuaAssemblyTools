LAT = { }

LAT.Lua51 = { }
local sbit = loadfile('/lasm/src/Lua51/bin.lua')()
LAT.Lua51.bit = sbit[1]
LAT.Lua51.DumpBinary = sbit[2]
LAT.Lua51.GetNumberType = loadfile('/lasm/src/Lua51/PlatformConfig.lua')()
LAT.Lua51.Verifier = loadfile('/lasm/src/Lua51/Verifier.lua')()
LAT.Lua51.Chunk = loadfile('/lasm/src/Lua51/Chunk.lua')()
LAT.Lua51.LuaFile = loadfile('/lasm/src/Lua51/LuaFile.lua')()
local ins = loadfile('/lasm/src/Lua51/Instruction.lua')()
LAT.Lua51.Instruction = ins[1]
LAT.Lua51.Local = ins[2]
LAT.Lua51.Constant = ins[3]
LAT.Lua51.Upvalue = ins[4]
LAT.Lua51.Disassemble = loadfile('/lasm/src/Lua51/Disassembler.lua')()
LAT.Lua51.Dump = loadfile('/lasm/src/Lua51/Dumper.lua')()
LAT.Lua51.Decompile = { }
LAT.Lua51.Decompile.LASM = loadfile('/lasm/src/Lua51/Decompiler/LASM.lua')()

LAT.Lua51.Lexer = loadfile('/lasm/src/Lua51/LasmParser/Lexer.lua')()
LAT.Lua51.Parser = loadfile('/lasm/src/Lua51/LasmParser/Parser.lua')()

LAT.Disassemble = function(s)
    local c = s:sub(5, 1)
    if c:len() == 0 then error("Invalid bytecode header") end
    local b = string.byte(c)
    if b == 0x51 then
        return LAT.Lua51.Disassemble(s)
    else
        error("Invalid bytecode header")
    end
end