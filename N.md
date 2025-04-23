standard deviation given 95% range
low, high = 100, 400  # Given range covering approximately 95%
mu_test = (low + high) / 2  # Mean calculation
sigma_test = (high - mu_test) / 2  # Standard deviation calculation
print(f"Standard Deviation: {round(sigma_test)}")
.......................................
# Generate x values
x = np.linspace(-4, 4, 100)
# Compute PDF
pdf = norm.pdf(x, mu, sigma)
# Compute CDF
cdf = norm.cdf(x, mu, sigma)
# Probability of X being less than 1.5 (P(X ≤ 1.5))
prob = norm.cdf(1.5, mu, sigma)
print(f"P(X ≤ 1.5): {prob:.4f}")
........................................
Example: IQ between 85 and 115 (mean=100, std=15)
p = norm.cdf(115, 100, 15) - norm.cdf(85, 100, 15)
........................................
if probability is given, use ppf norm.ppf(prob)
........................................
sample_mean = 72
std_dev = 12
sample_size = 36
confidence_level = 0.95
# Step 1: Z-score for 95% confidence
z_score = norm.ppf(1 - (1 - confidence_level) / 2)
# Step 2: Standard Error
standard_error = std_dev / math.sqrt(sample_size)
# Step 3: Margin of Error
margin = z_score * standard_error
# Step 4: Confidence Interval
lower = sample_mean - margin
upper = sample_mean + margin
........................................
A customer service representative successfully resolves a complaint 30% of the time (p = 0.3).
What is the probability that they handle 6 unsuccessful complaints before resolving 4 successfully?
p = 0.30, n = 4, k = 6
prob = nbinom.pmf(k,n,p)
