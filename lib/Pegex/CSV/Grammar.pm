package Pegex::CSV::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'share/csv.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.57)
  {
    '+grammar' => 'csv',
    '+toprule' => 'csv',
    '+version' => '0.0.1',
    'ANY' => {
      '.rgx' => qr/\G./
    },
    'EOL' => {
      '.rgx' => qr/\G\r?\n/
    },
    'EOS' => {
      '.rgx' => qr/\G\z/
    },
    '_' => {
      '.rgx' => qr/\G[\ \t]*/
    },
    'csv' => {
      '+min' => 0,
      '.ref' => 'row'
    },
    'double' => {
      '.rgx' => qr/\G[\ \t]*"((?:""|[^"])*)"/
    },
    'plain' => {
      '.rgx' => qr/\G[\ \t]*([^,\r\n]*)/
    },
    'row' => {
      '.all' => [
        {
          '+asr' => 1,
          '.ref' => 'ANY'
        },
        {
          '+max' => 1,
          '.all' => [
            {
              '.any' => [
                {
                  '.ref' => 'double'
                },
                {
                  '.ref' => 'plain'
                }
              ]
            },
            {
              '+min' => 0,
              '-flat' => 1,
              '.all' => [
                {
                  '.rgx' => qr/\G[\ \t]*,/
                },
                {
                  '.any' => [
                    {
                      '.ref' => 'double'
                    },
                    {
                      '.ref' => 'plain'
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          '.ref' => '_'
        },
        {
          '.any' => [
            {
              '.ref' => 'EOL'
            },
            {
              '.ref' => 'EOS'
            }
          ]
        }
      ]
    }
  }
}

1;
