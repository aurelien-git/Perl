    use Tk;
    # Creates a top level window
    $topwindow = MainWindow->new();
    # Create two buttons. The buttons print their names when clicked on.
    CreateButton($topwindow, "Secured!");
    CreateButton($topwindow, "Sir");
    Tk::MainLoop();                               # Dispatch events.
    #-------------------------------------------------------------------
    sub CreateButton {
        my ($parent,
            $title
           ) = @_;
        my($b);
        $callback_proc =
      sub {
          print "Button $title pressed\n";

      }
      ;
        $b = $parent->Button(
                             '-text'    => "$title",         # Button title
                             '-fg'      => 'red',            # foreground color
                             '-command' =>
                             $callback_proc
                             # sub to call when the button
                             # is pressed
                             );
        $b->pack();
    }
