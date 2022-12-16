---
description: >-
  An easy-to-use library for plotting maps is ggmap. This chapter introduces how
  to create map visualizations with this library.
---

# Geospatial Data

## Requirements

To use `ggmap`, we first must install it in our project:

```r
install.packages("ggmap")
```

Maps created with `ggmap` will show a background image of a map and assign the x- and y-axis  longitude and latitude of the map section. To obtain map images, we can choose from the two supported providers, [Google Maps](https://www.google.com/maps) or [Stamen Maps](http://maps.stamen.com/).  Stamen Maps do not require authentication with an API token (as Google Maps does), so in this introduction, we'll go with that.&#x20;

To get a background image for our map, we need to specify the bounding box in terms of longitude and latitude coordinates. To obtain the background image with minimal overhead and directly from our R-program, we install the `osmdata` package. This package accesses the [OpenStreetMap](https://www.openstreetmap.org/) service to get the bounding boxes:

```r
install-packages("osmdata")
```

## Creating a map visualization

To create a map, we go through the following steps:

1. [Retrieve the bounding box](geodaten.md#retrieve-the-bounding-box) for our desired background map image using `osmdata::getbb`. We can simply pass a query such as "Osnabrück" to the function. Any query that works on their [web interface](https://www.openstreetmap.org/) should also work with the function `getbb`.
2. [Get the background image](geodaten.md#get-the-background-image-from-stamen-maps) for our map with the `ggmap::get_map` function, passing the bounding box from step 1.
3. [Create the empty map](geodaten.md#create-the-empty-map) with `ggmap`.
4. [Add data layers](geodaten.md#add-the-data-layer), such as points on top of the map.

### Retrieve the bounding box

Let's assume we want to visualize our Campusbier orders on a map of Osnabrück. The data set contains the longitude and latitude information about the customer's billing address. Following the steps above, we first get the bounding box (longitude and latitude coordinates for the map's boundaries) for Osnabrück:

```r
library(osmdata)
city <- "Osnabrück"
bb_os <- getbb(city)
```

### Get the background image from Stamen Maps

We can now get the image by passing the bounding box to the `get_map` function:

```
os_map <- get_map(location = bb_os,
                 source = "stamen",
                 maptype = "terrain",
                 crop = TRUE,
                 color = "bw")
```

Note that the get\_map function has several arguments that we can use to specify the type of map we want. Stamen Maps support the different map types "terrain", "toner", and "watercolor", which all product a different look. Play around with it to see what works best for you. With `color = "bw"`, we can produce a grayscale version of the map.

### Create the empty map

We can display the map now using the `ggmap` function:

```
ggmap(os_map)
```

<figure><img src="../.gitbook/assets/image (55).png" alt=""><figcaption></figcaption></figure>

### Add the data layer

The final step is adding the data layer on top of the map:

```
ggmap(os_map)
  labs(x= NULL, y = NULL) +
  geom_point(data = orders_week, 
             aes(
               x = billing_address_longitude, 
               y = billing_address_latitude,
               size = total_price),
             color = "#009ee3",
             alpha = 0.7
            )
```

In this case, we draw points on the map for each order. The size of a point corresponds to the turnover (`total_price`) for each order. Order with more turnover appear larger:&#x20;

<figure><img src="../.gitbook/assets/image.png" alt=""><figcaption><p>A map of Osnabrück with orders shown as circles.</p></figcaption></figure>

## Choropleth maps

As an alternative to location-based maps, in which we draw points in certain positions (coordinates) of the map, we can draw shapes that correspond to an _area_ of the map. Zip codes are an example, as every zip code area can be described by a polygon. To work with an example, we can download the polygons along with other information about zip code areas in Germany from the following link:

{% embed url="https://public.opendatasoft.com/explore/dataset/georef-germany-postleitzahl/information/" %}

### Loading Shapefiles

I have downloaded and unpacked the Shapefile in my project folder under `data/plz_germany`. Then, I can load the Shapefile as follows, using the [`sf`-librbary](https://r-spatial.github.io/sf/):

```r
zip <- st_read(here("data/plz_germany/"), as_tibble = T)
```

When we look at the type of the zip object, we can see that it's a data frame or tibble, but also has the sf class:

```r
zip_shp %>%  class()

# [1] "sf"         "tbl_df"     "tbl"        "data.frame"
```



