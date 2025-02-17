# genetic-code-supremacy
Is the universal genetic code the best one possible? I created this code to evaluate the hypothesis that the universal genetic code is optimized for minimizing codon neighbor distances, which reduces the impact of mutations. This project was part of a first year computational biology class (CSB195) at UofT. Below is the report I wrote as part of the project.


Report
========

Author: Raees Kabir [✉](mailto:r.kabir@mail.utoronto.ca) 

14 October 2024

CSB195

Objective
---------

This report evaluates the hypothesis that the universal genetic code is optimized for minimizing codon neighbor distances, which reduces the impact of mutations.

Approach
--------

Compare the observed value of the standard genetic code (1272.931) to that of randomized genetic codes based on codon similarity metrics.

### 1 Background and Task for AI-Collaborator

-   Please collaborate with me on my first-year undergraduate Computational Foundations of Biology course Report 1 project.

-   Our task is to evaluate whether the universal genetic code is optimized for minimizing the distance between codon neighbors compared to randomized genetic codes.

-   We will do this using the programming language R, where we are already provided a similarity function for amino acids, a codon neighbor function which returns the 9 neighbors of a given codon, and a genetic code randomization function.

-   Using those functions, we need to make a realistic, random genetic code and calculate the pairwise distance between all codons and their codon neighbors. We must repeat this many times, record the results, and compare them to the standard genetic code.

-   At the end, we must interpret the observations with respect to the original question.

### 2 Process

SETUP: Created a new file "Raees_Report1_v1.0.R" in myScripts folder.

PART 1: Generation and Evaluating Genetic Codes

###### Steps that must be taken by the program to generate and evaluate 1000 random genetic codes![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfYRJSp5z7XEyyyn7g3jvgXm8LiUdhZlLu00PymsOTmpjNCFOsA4j6BBAWI6M9mLql01eXg_9SbFKhoW4StsXjpiMQGSupwGqlnAheyEQrl-ZHdhNevGXVhPsVbMymoa3xg6tqLu3mOjsT6sOdbR39fQ0i1?key=olavv0_KbGw_qZWlMvDEzg)

-   Defined evaluateCode() to calculate the sum of distances using the aaSim() function for each code by comparing codon neighbors using the neighCodons() function.

-   Defined evaluateRandomCodes() to generate 1000 random genetic codes (randomization seed 1011304214) using the rGC() function, and then computed the sum of distances for each using the evaluateCode() function

-   The evaluateRandomCodes() function writes each of sum of distance to a created file named "raees_report1_code_evaluations_v1.0.csv"

PART 2: Plotting Histogram
-   Generated a histogram by reading data from "raees_report1_code_evaluations_v1.0.csv" with the distributions of sum distances on x-axis and the probability density on the y-axis. This indicates how likely certain sum distances are to occur, rather than just the number of occurrences.
-   Overlaid normal distribution curve over the histogram.
 
 ![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcQ7wVvObj14bvj3jUUAbXNW8UUYSUFzg-bat_HqsNw1RA7gAVLzhAnZXi2Uf-iWu9ls5VXWA505mFPJmS_OtC-ur_mEelIfM4-ZrenEEk56jACeBTuh8fJxhCJz-QsR6evVaSRU4oIY7wp8rwDUL6Ic5ft?key=olavv0_KbGw_qZWlMvDEzg)


PART 3: Calculating Results

-   To assess the observed standard genetic code's distance against the random codes, the following were calculated:

-   mean of sum distances

-   standard deviation of sum distances

-   z-score

-   p-value

### 3 Results

1.  Mean Sum of Distances of Random Codes:  1848.625

2.  Standard Deviation of Sum Distances:  64.0324

3.  Z-Score: -8.990674

4.  P-Value: 2.457198e-19

### 4 Interpretation 

The results demonstrate the standard genetic code exhibits a sum of distances significantly lower than the mean of random genetic codes. With a z-score of about  -8.99, indicating nearly 9 standard deviations below the mean, and a p-value of approximately 2.46e-19, the likelihood of this occurring by chance is virtually zero. ![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeLrZ_ZykHRzemgSm0rXKkSvySwDQ42AVW9tToWd5TRRI7nTyATziY2yKSPAHvCwy-6F2jKF5DcgeksnMhV5VCxc79BXB-RZIGQoj3nqp40r06TalPMzGjwIz-Xhs2ii0cAUxQzBe2q6XMDxEmsOXu7FJlz?key=olavv0_KbGw_qZWlMvDEzg)

###### Image produced by Chat-GPT-4o to "visualize a graph of a normal distribution with a datapoint 9 standard deviations (labeled as 9 sigmas) to the left."

The distance of this data point away from the curve emphasizes the sheer significance of the z-score of our observed value. 

Conclusion
----------

This computational experiment suggests a remarkable level of optimization in the standard genetic code, far beyond what would be expected from random processes. The analysis strongly supports the idea that the standard genetic code is likely shaped by evolutionary pressures for stability against mutations.
