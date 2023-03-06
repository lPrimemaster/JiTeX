#include <string>

namespace jitex
{
    template<typename... Args>
    class JitexFunc
    {
    public:
        template<typename... ArgsF>
        friend JitexFunc<ArgsF...> parse_function(const std::string& f) noexcept;
        
        double operator()(Args... args)
        {
            return 0.0;
        }
    private:
        JitexFunc() noexcept;
    };

    template<typename... Args>
    JitexFunc<Args...> parse_function(const std::string& f) noexcept
    {
        constexpr size_t ARG_CNT = sizeof...(Args);
    }
}
