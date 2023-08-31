# The Unnamed Game Maker MMO
## But I propose 'noun arena online', for maximum early 2000 mmo cliche points. 

This is a repository for a multiplayer game maker game to be entered into the 50th GMC jam, to be developed from 31st of August to 4th of September.

## Folder structure.

There are three components to the MMO - the actual Game Maker game, the Node.js socket server that connects clients together, and the Django database that stores persistent data. 
Each component of the project has been given its own folder in the root of this repository. 

## Contribution

Contribution is limited to members of the Crimson Guild, one of the five gangs in the GMC jam #50, until the end of the jam. 


## Quick setup. 

Clone this repository. 

There are literally no files yet added, so that's literally all there is to it. However, once the jam starts and we can get going the likely procedure will be:

### Django database.

Make sure to have python installed. Then:

1 ) Activate the python enviroment contained in python_database\pyenv.
2 ) Using pip, install all the packages from requirements.txt
3 ) Run "Python manage.py migrate" to create and update the database schema
4 ) If you are running a fresh database, run "python manage.py createsuperuser", and create your admin role
5 ) run "python manage runserver 0.0.0.0:5000" to start a development server running from port 5000

From there you can head to localhost:5000/admin for the admin panel, and the node server can connect to the database. 

## Node server.

1 ) go into /node_server/
2 ) run "npm install" to install all the packages needed
3 ) run "npm run start" to run the development server. 

From there the GML client should be able to connect to your socket server on port 8080.

## Game Maker Client

1 ) Open the project in Game Maker.
2 ) If you are running from a local server, head to "macros.gml" and set "is_prod" to false. This will cause other macros to point towards the development socket server on port 5000.
3 ) Run the project, and run the game as the current level of development dictates. 
