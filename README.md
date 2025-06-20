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
 = clf.(X_test)
print(predictions)

#### NP SCALING
import numpy as np
import random
rng = np.default_rng(30)
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

