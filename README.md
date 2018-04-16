![alt text](https://raw.githubusercontent.com/jilucev/herd_cats/master/gps_images/cats/image_h.jpg)

# Herd Cats

Now you can herd cats methodically with the help of **Herd Cats**, a command line app that outputs GPS information on all your most coveted felines.

With this tool and a bit of audacity, any tech-savvy person who is open to trying pet-trafficking need never be lonely again.

_Note that this app can also be used to get the coordinates of jpgs that don't represent cats, I guess._

___

## Installation

Once you've cloned the repo, simply bundle and you're gtg.

```
bundle
```

___

## Running the app

Call it with no arguments to get info on our own specially curated candidates.

```
bundle exec bin/herd_cats get_coordinates
```

Alternatively, feed it a directory of images

```
 bundle exec bin/herd_cats get_coordinates './path/to/directory_of_images'
 ```

Then look within the project directory to find a freshly timestamped csv.

___

## Running the specs

Run the entire test suite

```
rspec spec
```

or individual specs

```
rspec spec/spec_filename.rb
```
