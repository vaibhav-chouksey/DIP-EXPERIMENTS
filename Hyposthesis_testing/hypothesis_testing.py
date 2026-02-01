import math

population_mean = 75
sample_mean = 72
sample_std_dev = 6
sample_size = 10
significance_level = 0.05
# Defining population mean, sample mean, standard deviation, sample size, and significance level

critical_z = 1.96
# Z critical value for two-tailed test at 5% significance level

standard_error = sample_std_dev / math.sqrt(sample_size)
# Calculating standard error (s / √n)

lower_limit = population_mean - critical_z * standard_error
upper_limit = population_mean + critical_z * standard_error
# Computing lower and upper critical value limits

print("Critical Value Method Output")
print("Lower Bound =", round(lower_limit, 2))
print("Upper Bound =", round(upper_limit, 2))
# Displaying critical range values

if lower_limit <= sample_mean <= upper_limit:
    print("\nSample mean lies inside the critical range.")
    print("Conclusion = Fail to reject H0 (Institute claim is accepted)")
    # Sample mean inside range → null hypothesis accepted
else:
    print("\nSample mean lies outside the critical range.")
    print("Conclusion = Reject H0 (Institute claim is not accepted)")
    # Sample mean outside range → null hypothesis rejected
