# Investigating Employment and Real Wage Growth in Ireland

## Data Preparation
The analysis processes three main datasets sourced from the CSO and can be found by inserting the codes into data.cso.ie:
1. Employment data and seasonally adjusted weekly wage data (EHQ03)
2. Consumer Price Index data (CPM02)

### Time Series Conversion
To harmonise the dataset some conversions of times series of the datasets was required:
- Quarter format conversion
- Monthly to quarterly CPI aggregation

## Economic Calculations

### Real Wage Calculation
Real wages are calculated using the CPI adjustment formula:

```math
\text{Real Wage} = \left(\frac{\text{Nominal Wage}}{\text{CPI}}\right) \times 100
```

where 100 is the base CPI value (December 2016).

### Growth Rate Calculations
For each metric, growth rates are calculated relative to Q1 2014:

```math
\text{Growth Rate}_t = \left(\frac{X_t}{X_{\text{base}}} - 1\right) \times 100
```

where:
- X_t is the value at time t
- X_base is the value in Q1 2014

Growth rates are calculated for each metric:

Employment Growth:
```math
\text{Employment Growth}_t = \left(\frac{\text{Employment}_t}{\text{Employment}_{\text{2014Q1}}} - 1\right) \times 100
```

Nominal Wage Growth:
```math
\text{Nominal Wage Growth}_t = \left(\frac{\text{Average Weekly Wage}_t}{\text{Average Weekly Wage}_{\text{2014Q1}}} - 1\right) \times 100
```

Real Wage Growth:
```math
\text{Real Wage Growth}_t = \left(\frac{\text{Real Wage}_t}{\text{Real Wage}_{\text{2014Q1}}} - 1\right) \times 100
```
