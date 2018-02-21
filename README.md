Jakes Film Database (JFDB) App

An app designed to create lists of your favorite movies. 

User -> List -> Movies

1. Build Movies -> Full RESTful Routes
2. Build Lists -> Full RESTful Routes
	New list has form to add movies
3. Build Users -> Full RESTful Routes
	User can create new lists
4. ActiveRecord Methods ->
	View a user's list
	

Movie => Unique Titles
	  -> has_and_belongs_to_many :lists
	  -> has_many :users, through: :lists
	title
	synopsis
	review_rating
	mpaa_rating

List =>
	-> has_and_belongs_to :movies
	-> belongs_to :user
	title
	description
	user_id
	movie_id

User => login, logout, signup
	 -> has_many :lists
	 -> has_many :movies, through: :lists
	first_name
	last_name
	email
	username
	password


Add validations -> Defend against invalid data
				-> Errors enclosed within a fields_with_errors class and error messages describing them

Add user authentication -> Devise is an option
						-> Add facebook, github, twitter, etc... login

Class level ActiveRecord scope methods -> .this_year, .highest_rated, .my_saved_movies

Nested resources -> User/1/lists/new

Nested Forms ->
You must include a nested form that writes to an associated model through a custom attribute writer. An example of this would be a New Recipe form that allowed you to add ingredients that are unique across recipes (thereby requiring a join model, or imagine being able to see all recipes that include Chicken), along with a quantity or description of the ingredient in the recipe. On this form you would have a series of fields named recipe[ingredient_attributes][0][name] and recipe[ingredient_attributes][0][description] which would write to the recipe model through a method ingredient_attributes=. This method cannot be provided via the accepts_nested_attributes_for macro because the custom writer would be responsible for finding or creating a recipe by name and then creating the row in the join model recipe_ingredients with the recipe_id, the ingredient_id, and the description from the form.

You must make use of a nested resource with the appropriate RESTful URLs. Additionally, your nested resource must provide a form that relates to the parent resource. Imagine an application with user profiles. You might represent a person's profile via the RESTful URL of /profiles/1, where 1 is the primary key of the profile. If the person wanted to add pictures to their profile, you could represent that as a nested resource of /profiles/1/pictures, listing all pictures belonging to profile 1. The route /profiles/1/pictures/new would allow me to upload a new picture to profile 1. Focus on making a working application first and then adding more complexity. Making a nested URL resource like '/divisions/:id/teams/new' is great. Having a complex nested resource like 'countries/:id/sports/:id/divisions/:id/teams/new' is going to make this much harder on you.

--------------------------------------------------------------------------------------------------------------------------
PART 2
JQUERY FRONT END
Pull movie information from IMDB or other API

Searchable database

Filters db search and individual lists applied dynamically

Dynamic 'add movie' forms on 'new list' view

Add comment system with dynamic text boxes