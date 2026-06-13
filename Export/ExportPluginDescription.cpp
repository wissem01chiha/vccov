#include "ExportPluginDescription.hpp"

namespace CppCoverage
{
    const std::wstring& ExportPluginDescription::GetPluginName() const
    {
        return pluginName_;
    }

    const std::wstring& ExportPluginDescription::GetParameterDescription() const
    {
        return parameterDescription_;
    }

    void ExportPluginDescription::CheckArgument(const std::optional<std::wstring>& parameter) const
    {
        checkArgumentFct_(parameter);
    }

}; // namespace CppCoverage