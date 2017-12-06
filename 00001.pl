#!/usr/bin/perl
print "Hello World!\n";

$a = 10;
$var = <<"EOF";
    This is the syntax for here document and it will continue
    until it encouters a EOF in the first line.
    This case of double quote so variable value will be
    interpolated. For example value of a = $a
EOF
print "$var\n";

# This is case of interpolation.
$str = "Welcome to \nHackers.Camp!";
print "$str\n";

# This is case of non-interpolation.
$str = 'Welcome to \nHackers.Camp!';
print "$str\n";

# Only W will become upper case.
$str = "\uwelcome to Hackers.Camp!";
print "$str\n";

# A portion of line will become capital.
$str = "Welcome to \UHackersCamp\E.com!";
print "$str\n";

# Backslash non alpha-numeric including spaces.
$str = "\QWelcome to HackersCamp's family";
print "$str\n";

$age = 25;
$name = "John Paul";
$salary = 9.9;

print "Age = $age\n";
print "Name = $name\n";
print "Salary = $salary\n";

%data = ('John Paul' , 45, 'Lisa', 30, 'Kumar', 40);

print "\$data{'John Paul'} = $data{'John Paul'}\n";
print "\$data{'Lisa'} = $data{'Lisa'}\n";
print "\$data{'Kumar'} = $data{'Kumar'}\n";
