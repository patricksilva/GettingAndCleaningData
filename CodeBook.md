# Course Project - CODE BOOK
### Getting and Cleaning Data
### January 2015

<br>

This is the code book for Step 5 of the project.

> *5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.*

The *melt()* and *dcast()* functions were performed on the data set from Step 4 to compute the desired result.  The data set was reduced from 10299 observations to 180 observations of 68 variables.  It would be interesting to see what would happen if the 'activity' type was 'character' instead of 'factor'.


|variable                                                                  |type                         |description                                                                           |
|:-------------------------------------------------------------------------|:----------------------------|:-------------------------------------------------------------------------------------|
|subject                                                                   |integer                      |identifier of the subject who performed the activity [1]                              |
|activity                                                                  |factor                    |activity of daily living performed [2]                                                |
|timeDomainSignalBodyAccelerationMeanOnXaxisOfPhone                        |numeric                      |mean of timeDomainSignalBodyAccelerationMeanOnXaxisOfPhone                            |
|timeDomainSignalBodyAccelerationMeanOnYaxisOfPhone                        |numeric                      |mean of timeDomainSignalBodyAccelerationMeanOnYaxisOfPhone                            |
|timeDomainSignalBodyAccelerationMeanOnZaxisOfPhone                        |numeric                      |mean of timeDomainSignalBodyAccelerationMeanOnZaxisOfPhone                            |
|timeDomainSignalBodyAccelerationStdOnXaxisOfPhone                         |numeric                      |mean of timeDomainSignalBodyAccelerationStdOnXaxisOfPhone                             |
|timeDomainSignalBodyAccelerationStdOnYaxisOfPhone                         |numeric                      |mean of timeDomainSignalBodyAccelerationStdOnYaxisOfPhone                             |
|timeDomainSignalBodyAccelerationStdOnZaxisOfPhone                         |numeric                      |mean of timeDomainSignalBodyAccelerationStdOnZaxisOfPhone                             |
|timeDomainSignalGravityAccelerationMeanOnXaxisOfPhone                     |numeric                      |mean of timeDomainSignalGravityAccelerationMeanOnXaxisOfPhone                         |
|timeDomainSignalGravityAccelerationMeanOnYaxisOfPhone                     |numeric                      |mean of timeDomainSignalGravityAccelerationMeanOnYaxisOfPhone                         |
|timeDomainSignalGravityAccelerationMeanOnZaxisOfPhone                     |numeric                      |mean of timeDomainSignalGravityAccelerationMeanOnZaxisOfPhone                         |
|timeDomainSignalGravityAccelerationStdOnXaxisOfPhone                      |numeric                      |mean of timeDomainSignalGravityAccelerationStdOnXaxisOfPhone                          |
|timeDomainSignalGravityAccelerationStdOnYaxisOfPhone                      |numeric                      |mean of timeDomainSignalGravityAccelerationStdOnYaxisOfPhone                          |
|timeDomainSignalGravityAccelerationStdOnZaxisOfPhone                      |numeric                      |mean of timeDomainSignalGravityAccelerationStdOnZaxisOfPhone                          |
|timeDomainSignalBodyAccelerationJerkMeanOnXaxisOfPhone                    |numeric                      |mean of timeDomainSignalBodyAccelerationJerkMeanOnXaxisOfPhone                        |
|timeDomainSignalBodyAccelerationJerkMeanOnYaxisOfPhone                    |numeric                      |mean of timeDomainSignalBodyAccelerationJerkMeanOnYaxisOfPhone                        |
|timeDomainSignalBodyAccelerationJerkMeanOnZaxisOfPhone                    |numeric                      |mean of timeDomainSignalBodyAccelerationJerkMeanOnZaxisOfPhone                        |
|timeDomainSignalBodyAccelerationJerkStdOnXaxisOfPhone                     |numeric                      |mean of timeDomainSignalBodyAccelerationJerkStdOnXaxisOfPhone                         |
|timeDomainSignalBodyAccelerationJerkStdOnYaxisOfPhone                     |numeric                      |mean of timeDomainSignalBodyAccelerationJerkStdOnYaxisOfPhone                         |
|timeDomainSignalBodyAccelerationJerkStdOnZaxisOfPhone                     |numeric                      |mean of timeDomainSignalBodyAccelerationJerkStdOnZaxisOfPhone                         |
|timeDomainSignalBodyGyroscopeMeanOnXaxisOfPhone                           |numeric                      |mean of timeDomainSignalBodyGyroscopeMeanOnXaxisOfPhone                               |
|timeDomainSignalBodyGyroscopeMeanOnYaxisOfPhone                           |numeric                      |mean of timeDomainSignalBodyGyroscopeMeanOnYaxisOfPhone                               |
|timeDomainSignalBodyGyroscopeMeanOnZaxisOfPhone                           |numeric                      |mean of timeDomainSignalBodyGyroscopeMeanOnZaxisOfPhone                               |
|timeDomainSignalBodyGyroscopeStdOnXaxisOfPhone                            |numeric                      |mean of timeDomainSignalBodyGyroscopeStdOnXaxisOfPhone                                |
|timeDomainSignalBodyGyroscopeStdOnYaxisOfPhone                            |numeric                      |mean of timeDomainSignalBodyGyroscopeStdOnYaxisOfPhone                                |
|timeDomainSignalBodyGyroscopeStdOnZaxisOfPhone                            |numeric                      |mean of timeDomainSignalBodyGyroscopeStdOnZaxisOfPhone                                |
|timeDomainSignalBodyGyroscopeJerkMeanOnXaxisOfPhone                       |numeric                      |mean of timeDomainSignalBodyGyroscopeJerkMeanOnXaxisOfPhone                           |
|timeDomainSignalBodyGyroscopeJerkMeanOnYaxisOfPhone                       |numeric                      |mean of timeDomainSignalBodyGyroscopeJerkMeanOnYaxisOfPhone                           |
|timeDomainSignalBodyGyroscopeJerkMeanOnZaxisOfPhone                       |numeric                      |mean of timeDomainSignalBodyGyroscopeJerkMeanOnZaxisOfPhone                           |
|timeDomainSignalBodyGyroscopeJerkStdOnXaxisOfPhone                        |numeric                      |mean of timeDomainSignalBodyGyroscopeJerkStdOnXaxisOfPhone                            |
|timeDomainSignalBodyGyroscopeJerkStdOnYaxisOfPhone                        |numeric                      |mean of timeDomainSignalBodyGyroscopeJerkStdOnYaxisOfPhone                            |
|timeDomainSignalBodyGyroscopeJerkStdOnZaxisOfPhone                        |numeric                      |mean of timeDomainSignalBodyGyroscopeJerkStdOnZaxisOfPhone                            |
|timeDomainSignalBodyAccelerationMagnitudeMean                             |numeric                      |mean of timeDomainSignalBodyAccelerationMagnitudeMean                                 |
|timeDomainSignalBodyAccelerationMagnitudeStd                              |numeric                      |mean of timeDomainSignalBodyAccelerationMagnitudeStd                                  |
|timeDomainSignalGravityAccelerationMagnitudeMean                          |numeric                      |mean of timeDomainSignalGravityAccelerationMagnitudeMean                              |
|timeDomainSignalGravityAccelerationMagnitudeStd                           |numeric                      |mean of timeDomainSignalGravityAccelerationMagnitudeStd                               |
|timeDomainSignalBodyAccelerationJerkMagnitudeMean                         |numeric                      |mean of timeDomainSignalBodyAccelerationJerkMagnitudeMean                             |
|timeDomainSignalBodyAccelerationJerkMagnitudeStd                          |numeric                      |mean of timeDomainSignalBodyAccelerationJerkMagnitudeStd                              |
|timeDomainSignalBodyGyroscopeMagnitudeMean                                |numeric                      |mean of timeDomainSignalBodyGyroscopeMagnitudeMean                                    |
|timeDomainSignalBodyGyroscopeMagnitudeStd                                 |numeric                      |mean of timeDomainSignalBodyGyroscopeMagnitudeStd                                     |
|timeDomainSignalBodyGyroscopeJerkMagnitudeMean                            |numeric                      |mean of timeDomainSignalBodyGyroscopeJerkMagnitudeMean                                |
|timeDomainSignalBodyGyroscopeJerkMagnitudeStd                             |numeric                      |mean of timeDomainSignalBodyGyroscopeJerkMagnitudeStd                                 |
|freqDomainSignalBodyAccelerationMeanOnXaxisOfPhone                        |numeric                      |mean of freqDomainSignalBodyAccelerationMeanOnXaxisOfPhone [3]                        |
|freqDomainSignalBodyAccelerationMeanOnYaxisOfPhone                        |numeric                      |mean of freqDomainSignalBodyAccelerationMeanOnYaxisOfPhone [3]                        |
|freqDomainSignalBodyAccelerationMeanOnZaxisOfPhone                        |numeric                      |mean of freqDomainSignalBodyAccelerationMeanOnZaxisOfPhone [3]                        |
|freqDomainSignalBodyAccelerationStdOnXaxisOfPhone                         |numeric                      |mean of freqDomainSignalBodyAccelerationStdOnXaxisOfPhone [3]                         |
|freqDomainSignalBodyAccelerationStdOnYaxisOfPhone                         |numeric                      |mean of freqDomainSignalBodyAccelerationStdOnYaxisOfPhone [3]                         |
|freqDomainSignalBodyAccelerationStdOnZaxisOfPhone                         |numeric                      |mean of freqDomainSignalBodyAccelerationStdOnZaxisOfPhone [3]                         |
|freqDomainSignalBodyAccelerationJerkMeanOnXaxisOfPhone                    |numeric                      |mean of freqDomainSignalBodyAccelerationJerkMeanOnXaxisOfPhone [3]                    |
|freqDomainSignalBodyAccelerationJerkMeanOnYaxisOfPhone                    |numeric                      |mean of freqDomainSignalBodyAccelerationJerkMeanOnYaxisOfPhone [3]                    |
|freqDomainSignalBodyAccelerationJerkMeanOnZaxisOfPhone                    |numeric                      |mean of freqDomainSignalBodyAccelerationJerkMeanOnZaxisOfPhone [3]                    |
|freqDomainSignalBodyAccelerationJerkStdOnXaxisOfPhone                     |numeric                      |mean of freqDomainSignalBodyAccelerationJerkStdOnXaxisOfPhone [3]                     |
|freqDomainSignalBodyAccelerationJerkStdOnYaxisOfPhone                     |numeric                      |mean of freqDomainSignalBodyAccelerationJerkStdOnYaxisOfPhone [3]                     |
|freqDomainSignalBodyAccelerationJerkStdOnZaxisOfPhone                     |numeric                      |mean of freqDomainSignalBodyAccelerationJerkStdOnZaxisOfPhone [3]                     |
|freqDomainSignalBodyGyroscopeMeanOnXaxisOfPhone                           |numeric                      |mean of freqDomainSignalBodyGyroscopeMeanOnXaxisOfPhone [3]                           |
|freqDomainSignalBodyGyroscopeMeanOnYaxisOfPhone                           |numeric                      |mean of freqDomainSignalBodyGyroscopeMeanOnYaxisOfPhone [3]                           |
|freqDomainSignalBodyGyroscopeMeanOnZaxisOfPhone                           |numeric                      |mean of freqDomainSignalBodyGyroscopeMeanOnZaxisOfPhone [3]                           |
|freqDomainSignalBodyGyroscopeStdOnXaxisOfPhone                            |numeric                      |mean of freqDomainSignalBodyGyroscopeStdOnXaxisOfPhone [3]                            |
|freqDomainSignalBodyGyroscopeStdOnYaxisOfPhone                            |numeric                      |mean of freqDomainSignalBodyGyroscopeStdOnYaxisOfPhone [3]                            |
|freqDomainSignalBodyGyroscopeStdOnZaxisOfPhone                            |numeric                      |mean of freqDomainSignalBodyGyroscopeStdOnZaxisOfPhone [3]                            |
|freqDomainSignalBodyAccelerationMagnitudeMean                             |numeric                      |mean of freqDomainSignalBodyAccelerationMagnitudeMean [3]                             |
|freqDomainSignalBodyAccelerationMagnitudeStd                              |numeric                      |mean of freqDomainSignalBodyAccelerationMagnitudeStd [3]                              |
|freqDomainSignalBodyAccelerationJerkMagnitudeMean                         |numeric                      |mean of freqDomainSignalBodyAccelerationJerkMagnitudeMean [3]                         |
|freqDomainSignalBodyAccelerationJerkMagnitudeStd                          |numeric                      |mean of freqDomainSignalBodyAccelerationJerkMagnitudeStd [3]                          |
|freqDomainSignalBodyGyroscopeMagnitudeMean                                |numeric                      |mean of freqDomainSignalBodyGyroscopeMagnitudeMean [3]                                |
|freqDomainSignalBodyGyroscopeMagnitudeStd                                 |numeric                      |mean of freqDomainSignalBodyGyroscopeMagnitudeStd [3]                                 |
|freqDomainSignalBodyGyroscopeJerkMagnitudeMean                            |numeric                      |mean of freqDomainSignalBodyGyroscopeJerkMagnitudeMean [3]                            |
|freqDomainSignalBodyGyroscopeJerkMagnitudeStd                             |numeric                      |mean of freqDomainSignalBodyGyroscopeJerkMagnitudeStd [3]                             |

**Notes**    
[1] an integer between 1 and 30 to identify one of the 30 subjects   
[2] one of six activities: walking, walking upstairs, walking downstairs, sitting, standing, laying   
[3] Fast Fourier Transforms

### **Table 1** - Description of variables.
