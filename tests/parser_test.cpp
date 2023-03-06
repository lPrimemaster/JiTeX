#include "antlr4-runtime.h"
#include "LanguageLexer.h"
#include "LanguageParser.h"

int main(int argc, char* argv[])
{
    antlr4::ANTLRInputStream input_stream("2+x_{2}/3");

    LanguageLexer lexer(&input_stream);
    antlr4::CommonTokenStream tokens(&lexer);
    LanguageParser parser(&tokens);
    
    std::cout << parser.expr()->toStringTree(true) << std::endl;
    
    return 0;
}
