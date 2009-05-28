use strict;
use Benchmark qw(cmpthese);

cmpthese(500, {
    dt => sub { 
        require DateTime;
        DateTime->import;
        delete $INC{"DateTime.pm"};
    },
    dt_lite => sub { 
        require DateTimeX::Lite; 
        DateTimeX::Lite->import();
        delete $INC{"DateTime/Lite.pm"};
    },
    dt_lite_full => sub { 
        require DateTimeX::Lite; 
        DateTimeX::Lite->import( qw(Arithmetic Strftime) );
        delete $INC{"DateTime/Lite.pm"};
        delete $INC{"DateTime/Lite/Arithmetic.pm"};
        delete $INC{"DateTime/Lite/Strftime.pm"};
    }
});