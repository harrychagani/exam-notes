#### MSE
from sklearn.metrics import mean_squared_error
import numpy as np
y_true = 
y_pred = 
mean_squared_error(y_true, y_pred)

#### TRAIN DECISION TREE
from sklearn.tree import DecisionTreeClassifier
import numpy as np

X = 
y = np.array([3, 2, 1, 0, 0, 3, 2, 3, 2, 1, 1, 0])
X_test = 

clf = DecisionTreeClassifier(random_state=178)
clf.fit(X, y)
predictions = clf.predict(X_test)
print(predictions)

#### NP SCALING
import numpy as np
import random
rng = np.random.default_rng(30)
X = rng.integers(0, 149, size=(77, 95))
amax = np.amax(X)
Y = X / amax
print(Y[4][53])

#### CONFUSION MATRIX
from sklearn.metrics import confusion_matrix
import numpy as np
y = 
preds = 
confusion_matrix(y, preds)

#### MSE
import numpy as np
from sklearn.metrics import mean_absolute_error

# Data
X = np.array([26, 51, 28, 1, 67])
y = np.array([13, 8, 10, 0, 7])
split = 59.0

# Split groups
left_mask = X <= split
right_mask = X > split

# Get y values for each group
y_left = y[left_mask]
y_right = y[right_mask]

# Compute MAE for each group using their respective group mean
mae_left = mean_absolute_error(y_left, [np.mean(y_left)] * len(y_left))
mae_right = mean_absolute_error(y_right, [np.mean(y_right)] * len(y_right))

# Compute total MAE (weighted by number of samples in each group)
total_mae = (len(y_left) * mae_left + len(y_right) * mae_right) / len(y)
print("Mean Absolute Error after split:", round(total_mae, 4))
