# DSCOVR the Future

## Trained Models

Decision Tree Regressor: https://storage.googleapis.com/dscovr/output/dt_model.joblib
Linear Regression: https://storage.googleapis.com/dscovr/output/lr_model.joblib

How to load them:

https://scikit-learn.org/stable/model_persistence.html

## The Challenge
Geomagnetic storms pose a significant threat to modern technological infrastructure. These storms, caused by solar winds interacting with Earth's magnetosphere, can lead to a wide range of disturbances. The core challenge lies in predicting these storms accurately, as the repercussions of a failed prediction can be catastrophic, ranging from satellite malfunctions to power grid failures.

Historical events such as the [Quebec Blackout of 1989](https://en.wikipedia.org/wiki/March_1989_geomagnetic_storm) stand testament to the immense disruption that these storms can cause. Such incidents, resulting from our inability to predict geomagnetic disturbances, have led to economic losses amounting to millions.

While tools and satellites like DSCOVR provide crucial data, translating this data into actionable insights remains a complex task. The aging equipment, coupled with the intricacies of space weather, makes accurate forecasting a formidable challenge.

The stakes are high. Disruptions aren't limited to power outages. Geomagnetic storms can compromise communication systems, jeopardize airplane navigation, and even put astronauts in space at risk. As our reliance on technology grows, so does the need for precise and timely storm predictions.

The challenge isn't just about harnessing vast amounts of data or upgrading to the latest equipment. It's about global collaboration, a holistic approach to prediction, and understanding the multifaceted impacts of these space weather events.

## Our AI Solution
To combat the unpredictability of geomagnetic storms, we leveraged  machine learning techniques. Our model ingests raw data from DSCOVR, processes it, and predicts potential storm activities.

By employing neural networks and regression algorithms, our solution adapts to the continually changing nature of space weather, offering accurate and timely predictions.

## Data Preprocessing
The raw data from DSCOVR was subjected to rigorous cleaning and transformation processes to make it suitable for training our model. We also performed feature engineering to derive more meaningful insights from the raw data. Learn more about feature engineering.

## Real-time Predictions
Our model is designed to handle real-time data, making predictions on the fly. As new data arrives, the model gets retrained periodically, ensuring the predictions are always based on the latest trends.

## Integration and Visualization
The AI model's predictions are integrated with an alert system that notifies stakeholders when a storm is predicted.

## Challenges & Learnings
Developing this solution came with its set of challenges, especially in terms of handling the vast amount of unknown data, as no one in the team knew about solar storms or related.


## Mapping DSCOVR to Planetary K-index
Mapping raw data from DSCOVR to the Planetary K-index was a critical step in our prediction process. By understanding the relationship between DSCOVR readings and geomagnetic activities, we were able to create a robust mapping mechanism.

This mapping acts as the foundation for our predictions, enabling our model to generate forecasts based on historical and real-time data.