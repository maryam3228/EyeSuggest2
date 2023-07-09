# Measure Visual Acuity Using a Mobile Application

This repository contains the source code and documentation for a mobile application that aims to address the inconvenience and inaccessibility of traditional methods for measuring visual acuity. The application leverages smartphone technology to provide a convenient and accessible method for testing visual acuity.

# Problem Definition

The traditional methods for measuring visual acuity require specialized equipment and professional assistance, making them time-consuming and costly for many users. This lack of convenience and accessibility can lead to undiagnosed visual impairments and negatively impact the quality of life for affected individuals. The objective of this project is to propose a mobile application that solves this problem by providing a convenient and accessible method for testing visual acuity.

# Project Overview

The proposed mobile application aims to develop a solution for visual acuity testing using a smartphone. It utilizes the smartphone's camera and display technology to provide a reliable and accurate test of the user's vision. The application follows standardized testing methodologies to ensure consistency and accuracy of results.

## Key Features:

- Accurate and reliable visual acuity testing
- Simulation of user's vision
- Map of nearby ophthalmologists
- Clear and concise visual acuity score report

The application is designed to be user-friendly and intuitive, with simple instructions and a user-friendly interface. It is compatible with Android operating systems and available for download on app stores.

# Algorithm

The algorithm used in the application follows the steps below to conduct visual acuity testing:

- Prompt the user to stand at the required distance from the screen and adjust the screen brightness to a comfortable level.
- Prompt the user to cover one eye and begin the test for the other eye.
- Display the first letter from the Snellen Chart, starting with the largest and most visible letter.
- Prompt the user to speak the letter out loud, and convert the spoken letter into text.
- Display the next letter from the same row of the Snellen Chart and continue until three letters from the row are displayed.
- If the user is unable to identify two letters consecutively, assign the acuity score of the previous line and end the test for that eye.
- Otherwise, display the next row of the Snellen Chart and continue the test until the user can no longer correctly identify the letters on a line.
- Record the smallest line on which the user was able to correctly identify at least two out of three letters.
- Repeat the test with the other eye.
- Calculate the user's visual acuity score using the formula: visual acuity = 10 / letter-size, where the letter-size is the size of the smallest line marked on the Snellen Chart that the user correctly identified the letters, and 10 is the actual distance between the user and the device in feet.
- Display the visual acuity score to the user for both eyes.

# EyeSuggest - The Mobile Application

https://github.com/Zafar7645/EyeSuggest/assets/73229846/6d7b0f08-09f9-4b60-a925-6e38df6da05c

# Analysis

A group of individuals was tested using both the traditional method and the developed mobile application for visual acuity tests. The results showed that the application provided more accurate results for the age group between 10-20 years old, while the outcomes of the application deviated from the outcomes of the traditional methods for the elderly population. This deviation could be attributed to age-related changes in the eye's lens and underlying health conditions affecting visual acuity in the elderly population.

To visualize the comparison between the traditional method and the application method, figures below show the blurriness percentage for different ages, both left-eye and right-eye.

## Graph showing the blurriness percentage obtained from traditional method and our app with respect to age

![image](https://github.com/Zafar7645/EyeSuggest/assets/73229846/db6375ff-286f-4b3e-8343-05c3eebc972d)

## Comparison of Visual Acuity Scores (left eye and right eye) for different ages collected from traditional method

![image](https://github.com/Zafar7645/EyeSuggest/assets/73229846/26887c49-3ba1-4385-b217-845feceb1f3c)

## Comparison of Visual Acuity Scores (left eye and right eye) for different ages collected from the app

![image](https://github.com/Zafar7645/EyeSuggest/assets/73229846/18c96374-409a-4d10-a0df-9dca147b7458)

## Average of traditional method’s acuity score with app’s acuity score with respect to age 

![image](https://github.com/Zafar7645/EyeSuggest/assets/73229846/aab8c74a-897c-41be-8e81-99a2a46f3983)

# Conclusion

In conclusion, this project presented a solution to the problem of measuring visual acuity using a mobile application. The developed system demonstrated accurate and reliable results compared to traditional visual acuity tests. The proposed system provides a convenient and accessible way for individuals to measure their visual acuity and has the potential to be integrated into telemedicine applications for remote monitoring of visual acuity by medical professionals.

# Future Scope

The proposed solution for measuring visual acuity using a mobile application has shown promising results. The future scope of this project involves:
- Integrating the proposed system into telemedicine applications for remote monitoring of visual acuity.
- Conducting further research to improve the accuracy and efficiency of the system.
- Exploring the potential of the system in remote areas with limited access to medical facilities.
- Enhancing the user-friendliness and accessibility of the system for individuals with varying degrees of technological proficiency.

# References

[1] Ambadekar, S., Chothani, D., Saha, S., Wadhwa, K., & Bhatia, N. (2021). Measuring Visual Acuity using Periscope and Android Application. SSRN Journal. [Online]. Available: https://www.ssrn.com/abstract=3867093

[2] Brady, C. J., Eghrari, A. O., & Labrique, A. B. (2015). Smartphone-Based Visual Acuity Measurement for Screening and Clinical Assessment. JAMA, 314(24), 2682. [Online]. Available: http://jama.jamanetwork.com/article.aspx?doi=10.1001/jama.2015.15855

[3] Agarwal, A., Abhishek, K., Kumar, V., Kumar, V., Prasad, N., & Singh, M. P. (2015). Dr. Eye: An Android Application to Calculate the Vision Acuity. Procedia Computer Science, 54, 697–702. [Online]. Available: https://linkinghub.elsevier.com/retrieve/pii/S1877050915014064

[4] Mehta, S., Shukla, R., & Bi, D. X. (2018). Sohammehta95/Ocufy: A Mobile Eye-testing interface. GitHub. [Online]. Available: https://github.com/sohammehta95/Ocufy

[5] Uchino, M., Kawashima, M., Kaido, M., Suwaki, K., Uchino, Y., Kawachi, I., Negishi, K., & Tsubota, K. (2017). Evaluation of a paper-based Visual Acuity Questionnaire. Clinical Ophthalmology, 11, 1213–1217.

[6] Stoll, N., Speeg-Schatz, C., Foggia, E. D., & Sauer, A. (2020). Development and validation of a new method for visual acuity assessment on tablet in pediatric population: Emova test.

[7] Patel, N. A., Alagappan, P. N., Pan, C., & Karth, P. (2020). A mobile vision testing application based on dynamic distance determination from the human corneal Limbus. Health Informatics Journal, 26(4), 3037–3055.

[8]	C. Perera, R. Chakrabarti, F. M. Islam, and J. Crowston, “The eye phone study: Reliability and accuracy of assessing snellen visual acuity using smartphone technology,” Eye, vol. 29, no. 7, pp. 888–894, 2015.

[9]	A. De Bortoli and O. Gaggi, “Playwitheyes: A new way to test children eyes,” 2011 IEEE 1st International Conference on Serious Games and Applications for Health (SeGAH), 2011.  

[10]	A.-H. Chen, F. N. N. Norazman, and N. H. Buari, “Comparison of visual acuity estimates using three different letter charts under two ambient room illuminations,” Indian Journal of Ophthalmology, vol. 60, no. 2, p. 101, 2012.  


# BlackBook
Take a look at the detailed documentation for the project including the published and submiited for review research papers and the screenshots of the application - EyeSuggest, as the results.

[EyeSuggest- BlackBook](https://drive.google.com/file/d/1CCKwdcG9bxpInvKIsu2Uxhfi9P-P6FK6/view?usp=sharing)
