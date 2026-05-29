# Vcov Contributaing Guide



vcov naming convetion :

folder naming :lowercase with hyphens eg core , third-party

files :  PascalCase should match class name if the file contain declation or implentaion of a class 

Function Names  camelCase omputeCoverageRate

Classes/Types PascalCase CoverageRateComputer 

Macros UPPERCASE_WITH_UNDERSCORES

Constants lowercase

Member Variables camelCase with prefix or suffix


class CoverageAnalyzer {
private:
    int coverageRate_;                 
    // or
    int m_coverageRate;                
    
    int CoverageRate;                 // Avoid
    int coverage_rate;                // Avoid 
}; 