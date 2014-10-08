package Pegex::CSV;
our $VERSION = '0.0.1';

use Pegex::Base;

use Pegex::CSV::Grammar;
use Pegex::CSV::LoL;

sub load {
    my ($self, $csv) = @_;

    my $parser = Pegex::Parser->new(
        grammar => Pegex::CSV::Grammar->new,
        receiver => Pegex::CSV::LoL->new,
    );

    return $parser->parse($csv);
}

1;
