
## [A010_Then_Contains_String.md](../../features/A010_Then_Contains_String.md)  

  ### Feature: testing that a file contains a line  

  - [X] scenario [test on a string output](../../features/A010_Then_Contains_String.md) pass  

  - [X] scenario [test on a multiline output](../../features/A010_Then_Contains_String.md) pass  

  - [X] scenario [test on a file](../../features/A010_Then_Contains_String.md) pass  


## [A020_Then_Contains.md](../../features/A020_Then_Contains.md)  

  ### Feature: "contains" a string feature  

  - [X] scenario [test the standard output](../../features/A020_Then_Contains.md) pass  

  - [X] scenario [compare with an existing file](../../features/A020_Then_Contains.md) pass  


## [A030_Then_Does_Not_Contain.md](../../features/A030_Then_Does_Not_Contain.md)  

  ### Feature: checking that some string is not present in output or file  

  - [X] scenario [Successful checks](../../features/A030_Then_Does_Not_Contain.md) pass  

  - [X] scenario [Failed "output doesnt contain"](../../features/A030_Then_Does_Not_Contain.md) pass  

  - [X] scenario [Failed "file doesn't contain"](../../features/A030_Then_Does_Not_Contain.md) pass  


## [A040_Example_Keyword.md](../../features/A040_Example_Keyword.md)  

  ### Feature: The keyword `Example` is a synonym of the keyword `Scenario`.  

  - [X] scenario [NOK return code](../../features/A040_Example_Keyword.md) pass  

  - [X] scenario [NOK return code](../../features/A040_Example_Keyword.md) pass  


## [A050_Then_File_Is_Code_Fence.md](../../features/A050_Then_File_Is_Code_Fence.md)  

  ### Feature: testing the "file is" feature  

  - [X] scenario [file is as expected](../../features/A050_Then_File_Is_Code_Fence.md) pass  

  - [X] scenario [file is not as expected](../../features/A050_Then_File_Is_Code_Fence.md) pass  


## [A060_Then_File_Equal_File_String.md](../../features/A060_Then_File_Equal_File_String.md)  

  ### Feature: "file is" followed by a code span (a string)  

  - [X] scenario [test on a single line file](../../features/A060_Then_File_Equal_File_String.md) pass  

  - [X] scenario [adding a second line to the file, so the same test should fail](../../features/A060_Then_File_Equal_File_String.md) pass  


## [A065_Then_File_Equal_File_Code_Fence.md](../../features/A065_Then_File_Equal_File_Code_Fence.md)  

  ### Feature: file is equal to a file  

  - [X] scenario [test `is equal to file` form](../../features/A065_Then_File_Equal_File_Code_Fence.md) pass  

  - [X] scenario [test `is equal to file` when files are *not* equal](../../features/A065_Then_File_Equal_File_Code_Fence.md) pass  

  - [X] scenario [test the negative form `is not equal to file`](../../features/A065_Then_File_Equal_File_Code_Fence.md) pass  


## [A070_Then_Get_Code_Span.md](../../features/A070_Then_Get_Code_Span.md)  

  ### Feature: checking an expected multiline output  

  - [X] scenario [asking for sut help](../../features/A070_Then_Get_Code_Span.md) pass  

  - [X] scenario [causing an sut error with a long explanation](../../features/A070_Then_Get_Code_Span.md) pass  


## [A080_Then_Output_Equal_To_File.md](../../features/A080_Then_Output_Equal_To_File.md)  

  ### Feature: output is equal to a file  

  - [X] scenario [test `output is equal` keyword](../../features/A080_Then_Output_Equal_To_File.md) pass  


## [A090_Then_Get_Error.md](../../features/A090_Then_Get_Error.md)  

  ### Feature: return code test  

  - [X] scenario [NOK return code](../../features/A090_Then_Get_Error.md) pass  

  - [X] scenario [OK return code](../../features/A090_Then_Get_Error.md) pass  


## [A100_Then_Get_Stderr.md](../../features/A100_Then_Get_Stderr.md)  

  ### Feature: stderr test  

  - [X] scenario [unknown option](../../features/A100_Then_Get_Stderr.md) pass  


## [A110_Then_No_Output.md](../../features/A110_Then_No_Output.md)  

  ### Feature: Check that there is no output  

  - [X] scenario [silent operation](../../features/A110_Then_No_Output.md) pass  

  - [X] scenario [silent operation expected, but there is an output](../../features/A110_Then_No_Output.md) pass  


## [A120_Then_Get_String.md](../../features/A120_Then_Get_String.md)  

  ### Feature: checking a message line on stdout  

  - [X] scenario [asking for sut version](../../features/A120_Then_Get_String.md) pass  


## [A130_Successfully_Keyword.md](../../features/A130_Successfully_Keyword.md)  

  ### Feature: The “successfully” shortcut  

  - [X] scenario [*when I successfully run* a command with successful run](../../features/A130_Successfully_Keyword.md) pass  

  - [X] scenario [*when I successfully run* a command with a wrong command line, returns an error status](../../features/A130_Successfully_Keyword.md) pass  

  - [X] scenario [*when I run* a command with a wrong command line](../../features/A130_Successfully_Keyword.md) pass  


## [A140_Unordered_Keyword.md](../../features/A140_Unordered_Keyword.md)  

  ### Feature: when the modifier `unordered` is given after `get`, order of line is ignored  

  Feature background   
  - [X] scenario ["I get" without the modifier](../../features/A140_Unordered_Keyword.md) pass  

  Feature background   
  - [X] scenario [same "I get" with the modifier](../../features/A140_Unordered_Keyword.md) pass  

  Feature background   
  - [X] scenario ["contains" without the modifier](../../features/A140_Unordered_Keyword.md) pass  

  Feature background   
  - [X] scenario [same "contains" but with the "unordered" modifier](../../features/A140_Unordered_Keyword.md) pass  


## [A150_Background_Keyword.md](../../features/A150_Background_Keyword.md)  

  ### Feature: Feature 1  

  Document Background Background1  
  Feature background Background2 in feature 1  
  - [X] scenario [lets erase what was created by previous background runs](../../features/A150_Background_Keyword.md) pass  

  Document Background Background1  
  Feature background Background2 in feature 1  
  - [X] scenario [Two Background executed](../../features/A150_Background_Keyword.md) pass  

  ### Feature: Feature 2  

  Document Background Background1  
  - [X] scenario [lets erase once more what was created by previous background runs](../../features/A150_Background_Keyword.md) pass  

  Document Background Background1  
  - [X] scenario [only first background should apply](../../features/A150_Background_Keyword.md) pass  


## [A160_Ignoring_Blank_Lines.md](../../features/A160_Ignoring_Blank_Lines.md)  

  - [X] scenario [Comparing ignoring blank lines](../../features/A160_Ignoring_Blank_Lines.md) pass  


## [A170_File_vs_File_Name.md](../../features/A170_File_vs_File_Name.md)  

  ### Feature: expected content in a file  

  - [X] scenario ["Then I get file" form](../../features/A170_File_vs_File_Name.md) pass  

  - [X] scenario ["Then output is | contains | does not contain file" form](../../features/A170_File_vs_File_Name.md) pass  

  - [X] scenario ["Then file is | contains | does not contain file" form](../../features/A170_File_vs_File_Name.md) pass  


## [B010_Deleting_created_files.md](../../features/B010_Deleting_created_files.md)  

  ### Feature: tmp files and directories deletion  

  - [X] scenario [run without --cleanup](../../features/B010_Deleting_created_files.md) pass  

  - [X] scenario [run with --cleanup](../../features/B010_Deleting_created_files.md) pass  


## [B020_Exec_dir.md](../../features/B020_Exec_dir.md)  

  ### Feature: **Exec Dir**  

  Feature background create some dir and file  
  - [X] scenario [Lets run `create_tree` in the current dir](../../features/B020_Exec_dir.md) pass  

  Feature background create some dir and file  
  - [X] scenario [Lets run `create_tree` in ./dir2](../../features/B020_Exec_dir.md) pass  


## [B030_File_test_and_creation.md](../../features/B030_File_test_and_creation.md)  

  ### Feature: testing the existence of a file  

  - [X] scenario [a required file does not exist](../../features/B030_File_test_and_creation.md) pass  

  - [X] scenario [the required file is created](../../features/B030_File_test_and_creation.md) pass  

  - [X] scenario ["Given there is no", when there actually is, should erase the file](../../features/B030_File_test_and_creation.md) pass  


## [B040_Find_scenarios.md](../../features/B040_Find_scenarios.md)  

  ### Feature: multiples scenarios given in command line  

  Feature background   
  - [X] scenario [no file or dir on the command line](../../features/B040_Find_scenarios.md) pass  

  Feature background   
  - [X] scenario [running all scenarios in dir1](../../features/B040_Find_scenarios.md) pass  

  Feature background   
  - [X] scenario [running multiple scenarios given on command line](../../features/B040_Find_scenarios.md) pass  

  Feature background   
  - [X] scenario [running scenarios in a tree thanks to `-r`](../../features/B040_Find_scenarios.md) pass  

  Feature background   
  - [X] scenario [error msg when trying to run scenarios, but none found in given directories](../../features/B040_Find_scenarios.md) pass  

  Feature background   
  - [X] scenario [empty list file on -lf if there is no scenario in given directories](../../features/B040_Find_scenarios.md) pass  


## [B050_Strict_gherkin.md](../../features/B050_Strict_gherkin.md)  

  ### Feature: Strict Gherkin rules  

  - [X] scenario [Multiple When in a scenario](../../features/B050_Strict_gherkin.md) pass  


## [B060_Return_code_on_test_failure.md](../../features/B060_Return_code_on_test_failure.md)  

  ### Feature: return code on test failure  

  - [X] scenario [return code on test success](../../features/B060_Return_code_on_test_failure.md) pass  

  - [X] scenario [return code when the test fail](../../features/B060_Return_code_on_test_failure.md) pass  

  - [X] scenario [return code when one fail and the other succeed](../../features/B060_Return_code_on_test_failure.md) pass  


## [B070_Mandatory_new_bug.md](../../features/B070_Mandatory_new_bug.md)  

  Document Background   
  - [X] scenario [](../../features/B070_Mandatory_new_bug.md) pass  


## [B080_Keep_Going.md](../../features/B080_Keep_Going.md)  

  ### Feature: on error, Keep going or stop  

  Feature background   
  - [X] scenario [with `-k`](../../features/B080_Keep_Going.md) pass  

  Feature background   
  - [X] scenario [without `-k`](../../features/B080_Keep_Going.md) pass  


## [B090_tmp_dir.md](../../features/B090_tmp_dir.md)  

  ### Feature: Tmp dir  

  - [X] scenario [](../../features/B090_tmp_dir.md) pass  


## [C010_Empty_scenarios.md](../../features/C010_Empty_scenarios.md)  

  - [X] scenario [No step test](../../features/C010_Empty_scenarios.md) pass  

  - [X] scenario [No scenario test](../../features/C010_Empty_scenarios.md) pass  


## [C020_Escaped_char.md](../../features/C020_Escaped_char.md)  

  ### Feature: Space in names  

  - [X] scenario [Directory with space in the name](../../features/C020_Escaped_char.md) pass  


## [C030_Markdown_syntax.md](../../features/C030_Markdown_syntax.md)  

  ### Feature: Tolerance to formatting variations  

  - [X] scenario [Heading variations](../../features/C030_Markdown_syntax.md) pass  

  - [X] scenario [Missing heading marker](../../features/C030_Markdown_syntax.md) pass  


## [C040_Missing_title.md](../../features/C040_Missing_title.md)  

  - [X] scenario [Missing tittle in scenario, background and feature](../../features/C040_Missing_title.md) pass  


## [C050_Step_marker.md](../../features/C050_Step_marker.md)  

  ### Feature:   

  - [X] scenario [](../../features/C050_Step_marker.md) pass  


## [C060_code_block.md](../../features/C060_code_block.md)  

  - [X] scenario [Code fenced blocks](../../features/C060_code_block.md) pass  


## [C070_missing_code_block.md](../../features/C070_missing_code_block.md)  

  ### Feature: missing or erroneous code blocks  

  - [X] scenario [Code block missing at the end of the file](../../features/C070_missing_code_block.md) pass  

  - [X] scenario [closing code block mark missing](../../features/C070_missing_code_block.md) pass  


## [C080_missing_scenario.md](../../features/C080_missing_scenario.md)  

  ### Feature:   

  - [X] scenario [No scenario](../../features/C080_missing_scenario.md) pass  


------------------
- Failed     =  0
- Successful =  73
- Empty      =  0
