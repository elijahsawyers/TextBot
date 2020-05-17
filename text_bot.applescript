# Author: Elijah Sawyers
# Date: 05/17/2020
# Overview: this script texts the message in the MESSAGE.txt file line by line
# with a 1.5 second delay between lines. You must ensure that the person that
# you are going to text already has a conversation in the Messages app. Also,
# this only works with iMessage, not SMS.


-- First, open the Messages application.
launch application "Messages"

-- Set the message file path.
tell application "Finder"
    set srcFile to (container of (path to me) as text) & "MESSAGE.txt"
end tell

-- Read lines from the message file file.
set lns to paragraphs of (read file srcFile as «class utf8»)

-- Loop over each line of the message file.
repeat with ln in lns
    set the clipboard to ln
    -- Text tell block.
     tell application "Messages"
          --Steal focus.
          activate

          -- Set text parameters.
          set targetService to id of first service whose service type = iMessage
          set phoneNumber to "+13343501924"
          set textMessage to (the clipboard)

          -- Send the text.
          send textMessage to buddy phoneNumber of service id targetService
     end tell

     -- Delay for a second and a half.
     delay 1.5
end repeat
