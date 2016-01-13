---
layout: post
title: Great Britain - hills and roads in open OS data
date: 2015-12-15 13:41:55
categories:
---

So I was looking around for nice open datasets to play with for an assignment
and found all the hills and roads of Great Britain, courtesy the Ordnance Survey,
© Crown copyright under the [Open government license](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).
Here's the [full list and page to request a download](https://www.ordnancesurvey.co.uk/opendatadownload/products.html).

OS Terrain 50 is a digital elevation model at 50m resolution:

[![UK elevation](/images/thumb/os_elevation-uk.png)](/images/full/os_elevation-uk.png)

Here lighter colours represent higher ground.

I had three main steps to get there:

(1) Some unzipping - the downloaded folder contained a data folder, with a zip
for each major grid square. Tiny bash script, the kind I frequently lean on
StackOverflow for:

{% highlight sh %}
for z in data/*/*.zip; do unzip $z; done
{% endhighlight %}

(2) A neat [GDAL function](http://www.gdal.org/gdalbuildvrt.html) to build a
virtual layer. This makes the next step simpler! Thanks to Rowan Blaik
(via DuckDuckGo) for [the gdalbuildvrt tip-off](http://www.landscape-laboratory.org/2013/06/19/getting-started-with-os-terrain-50-elevation-data/).

{% highlight sh %}
gdalbuildvrt gdm.vrt data/*.asc
{% endhighlight %}

(3) Load into [QGIS](http://qgis.org/) as a new raster layer, wait a little
patiently for it to render, and flip the colours in the layer properties (for
my linux version of QGiS, that's right click on a layer for 'properties' > style
> band rendering > colour gradient).

Then the Open Roads dataset is much less work, just unzip and load the shapefile:

[![UK roads](/images/thumb/os_roads-uk-0.1mil.png)](/images/full/os_roads-uk-0.1mil.png)

Here are the two overlaid:

[![UK roads and elevation](/images/thumb/os_elevation-roads-uk-0.01mil.png)](/images/full/os_elevation-roads-uk-0.01mil.png)

Here's the North East zoomed in a bit - that's the Tyne river going left-to-right
along the middle, and the Tees estuary at the bottom:

[![North-east elevation](/images/thumb/os_elevation-ne.png)](/images/full/os_elevation-ne.png)

And with roads overlaid:

[![North-east roads and elevation](/images/thumb/os_elevation-roads-ne.png)](/images/full/os_elevation-roads-ne.png)

