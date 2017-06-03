use strict;
use warnings;
use parent 'NativeCall';

sub XGBGetLastError :Args() :Native(xgboost)
 :Returns(string) {}
sub XGDMatrixCreateFromFile :Args(string, int, opaque*) :Native(xgboost)
 :Returns(int) {}
sub XGDMatrixNumRow :Args(opaque, uint64*) :Native(xgboost) :Returns(int) {}
sub XGDMatrixNumCol :Args(opaque, uint64*) :Native(xgboost) :Returns(int) {}
sub XGBoosterCreate :Args(opaque[], uint64, opaque*) :Native(xgboost)
 :Returns(int) {}
sub XGBoosterFree :Args(opaque) :Native(xgboost) :Returns(int) {}
sub XGBoosterUpdateOneIter :Args(opaque, int, opaque) :Native(xgboost) 
 :Returns(int) {}
sub XGBoosterPredict :Args(opaque, opaque, int, uint, uint64*, opaque*)
 :Native(xgboost) :Returns(int) {}

