#!/usr/bin/env perl

use strict;
use warnings;

while (<>) {
    if (/line \d+\./) {
        `osascript -e 'display notification "$_" with title "warnings" '`
    }
    print;
}
