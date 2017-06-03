use 5.010;
use AI::XGBoost::CAPI;
use FFI::Platypus;
use Data::Table;
use HTML::Show;

my $silent = 0;
my ($dtrain, $dtest) = (0, 0);

AI::XGBoost::CAPI::XGDMatrixCreateFromFile('agaricus.txt.test', $silent, \$dtest);
AI::XGBoost::CAPI::XGDMatrixCreateFromFile('agaricus.txt.train', $silent, \$dtrain);

my ($rows, $cols) = (0, 0);
AI::XGBoost::CAPI::XGDMatrixNumRow($dtrain, \$rows);
AI::XGBoost::CAPI::XGDMatrixNumCol($dtrain, \$cols);
say "Dimensions: $rows, $cols";

my $booster = 0;
AI::XGBoost::CAPI::XGBoosterCreate( [$dtrain] , 1, \$booster);
for my $iter (0 .. 10) {
 AI::XGBoost::CAPI::XGBoosterUpdateOneIter($booster, $iter, $dtrain);
}

my $out_len = 0;
my $out_result = 0;

AI::XGBoost::CAPI::XGBoosterPredict($booster, $dtest, 0, 0, \$out_len, \$out_result);
my $ffi = FFI::Platypus->new();
my $predictions = $ffi->cast(opaque => "float[$out_len]", $out_result);

my $result = Data::Table->new();
$result->addCol($predictions, 'Mushroom');
HTML::Show::show($result->subTable([0..20])->html);

AI::XGBoost::CAPI::XGBoosterFree($booster);

