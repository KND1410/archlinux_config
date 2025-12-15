# config.fish file

set LOGO_DIR $HOME/.config/fastfetch/logos
set USED_FILE $HOME/.config/fastfetch/used_logos.txt

function fastfetch_random
    if not test -d $LOGO_DIR
        echo "Logos directory does not exist: $LOGO_DIR"
        return
    end

    set all_logos (ls $LOGO_DIR)

    if test (count $all_logos) -eq 0
        echo "No logos found in directory $LOGO_DIR"
        return
    end

    # Read used logos from file if it exists
    if test -f $USED_FILE
        set used_logos (cat $USED_FILE)
    else
        set used_logos
    end

    # Find unused logos
    set unused_logos
    for logo in $all_logos
        if not contains $logo $used_logos
            set unused_logos $unused_logos $logo
        end
    end

    # If all logos have been used, reset
    if test (count $unused_logos) -eq 0
        set unused_logos $all_logos
        # Clear the file
        echo -n > $USED_FILE
        set used_logos
    end

    # Choose a random logo
    set rand_index (random 1 (count $unused_logos))
    set LOGO $unused_logos[$rand_index]

    # Update used logos file
    echo $LOGO >> $USED_FILE

    # Run fastfetch
    fastfetch --logo $LOGO_DIR/$LOGO
end

# Call the function immediately
fastfetch_random
