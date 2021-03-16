![](https://assets-global.website-files.com/5b69e8315733f2850ec22669/5b749a4663ff82be270ff1f5_GSC%20Lockup%20(Orange%20%3A%20Black).svg)

### Welcome to the take home portion of your interview! We're excited to jam through some technical stuff with you, but first it'll help to get a sense of how you work through data and coding problems. Work through what you can independently, but do feel free to reach out if you have blocking questions or problems.

1) This requires Postgres (9.4+) & Rails(4.2+), so if you don't already have both installed, please install them.

2) Download the data file from: https://github.com/gospotcheck/ps-code-challenge/blob/master/Street%20Cafes%202020-21.csv

3) Add a varchar column to the table called `category`. 
    
    *Jim*: Rails migration adds the column to the Cafes table.

4) Create a view with the following columns[provide the view SQL]
    - post_code: The Post Code
    - total_places: The number of places in that Post Code
    - total_chairs: The total number of chairs in that Post Code
    - chairs_pct: Out of all the chairs at all the Post Codes, what percentage does this Post Code represent (should sum to 100% in the whole view)
    - place_with_max_chairs: The name of the place with the most chairs in that Post Code
    -max_chairs: The number of chairs at the place_with_max_chairs
	
    *Please also include a brief description of how you verified #4*

    *Jim*: 
    - SELECT * FROM post_codes; will provide the view SQL
    - I used psql and checked values to make sure they were correct. I had to stumble through modifying my query in the terminal to get it right. This is my first time creating a sql view and I am unfamiliar with testing methods. Becoming more familiar with those practices will make future tasks of this nature go faster. So far I have been unable to figure out how to add my sql view files to git, but running the migrations will at least generate those locally.

5) Write a Rails script to categorize the cafes and write the result to the category according to the rules:[provide the script]
    - If the Post Code is of the LS1 prefix type:
        - `# of chairs less than 10: category = 'ls1 small'`
        - `# of chairs greater than or equal to 10, less than 100: category = 'ls1 medium'`
        - `# of chairs greater than or equal to 100: category = 'ls1 large' `
    - If the Post Code is of the LS2 prefix type: 
        - `# of chairs below the 50th percentile for ls2: category = 'ls2 small'`
        - `# of chairs above the 50th percentile for ls2: category = 'ls2 large'`
    - For Post Code is something else:
        - `category = 'other'`

    *Please share any tests you wrote for #5*

    *Jim*: I decided to go with a rake task to update the categories. This way it can be run from the command line. Run **rake development:categorize** after setup steps (rake db:create, migrate, seed).

6) Write a custom view to aggregate the categories [provide view SQL AND the results of this view]
    - category: The category column
    - total_places: The number of places in that category
    - total_chairs: The total chairs in that category
    
    *Jim*: 
    - SELECT * FROM categories; will provide the view SQL
    - | category   | total_places | total_chairs |
    - |------------|--------------|--------------|
    - | ls1_large  | 1            | 152          |
    - | ls1_medium | 49           | 1223         |
    - | ls1_small  | 11           | 64           |
    - | ls2_large  | 4            | 438          |
    - | ls2_small  | 6            | 135          |
    - | other      | 2            | 67           |

7) Write a script in rails to:
    - For street_cafes categorized as small, write a script that exports their data to a csv and deletes the records
    - For street cafes categorized as medium or large, write a script that concatenates the category name to the beginning of the name and writes it back to the name column
	
    *Please share any tests you wrote for #7*

8) Show your work and check your email for submission instructions.

9) Celebrate, you did great! 


