
// Create Tables

TABLE saas_category as category
{
	catid SMALLINT [pk, increment, not null]
	catgroup VARCHAR
	catname VARCHAR
	catdesc VARCHAR
}


TABLE saas_event as event
{
  eventid INT [pk, increment, not null]
  venueid SMALLINT [not null]
  catid SMALLINT [not null]
  dateid SMALLINT [not null]
  eventname VARCHAR
  starttime TIMESTAMP
}

TABLE saas_venue as venue
{
  venueid SMALLINT [pk, increment, not null]
  venuename VARCHAR
  venuecity VARCHAR
  venuestate CHAR(2)
  vanueseat INT [DEFAULT: 0]
}

TABLE ecomm_listing as listing
{
  listid INT [pk, increment, not null]
  sellerid INT [not null]
  eventid INT [not null]
  dateid SMALLINT [not null]
  numtickets SMALLINT [not null]
  priceperticket decimal(8,2) [not null]
  totalprice decimal(8,2) [not null]
  listtime TIMESTAMP [not null]
}

TABLE ecomm_sale as sale
{
  saleid INT [pk, increment, not null]
  listid INT [not null]
  sellerid INT [not null]
  buyerid INT [not null]
  dateid SMALLINT [not null]
  qtysold SMALLINT [not null]
  pricepaid decimal(8,2) [not null]
  commission decimal(8,2) [not null]
  saletime TIMESTAMP [not null]
}

TABLE ecomm_date as date
{
  dateid SMALLINT [pk, increment, not null]
  caldate date [not null]
  day CHAR(3) [not null]
  week SMALLINT [not null]
  month CHAR(5) [not null]
  qtr CHAR(5) [not null]
  year SMALLINT [not null]
  holiday boolean [not null, DEFAULT: false]
}

TABLE crm_user as user
{
	userid INT [pk, increment, not null]
	username CHAR(8)
	firstname VARCHAR
	lastname VARCHAR
	city VARCHAR
	state CHAR(2)
	email VARCHAR
	phone CHAR
	likesports BOOLEAN [DEFAULT: false]
	liketheatre BOOLEAN [DEFAULT: false]
	likeconcerts BOOLEAN [DEFAULT: false]
	likejazz BOOLEAN [DEFAULT: false]
	likeclassical BOOLEAN [DEFAULT: false]
	likeopera BOOLEAN [DEFAULT: false]
	likerock BOOLEAN [DEFAULT: false]
	likevegas BOOLEAN [DEFAULT: false]
	likebroadway BOOLEAN [DEFAULT: false]
	likemusicals BOOLEA [DEFAULT: false]
}


// Add Reference
Ref: event.catid > category.catid
Ref: event.venueid > venue.venueid
Ref: event.dateid > date.dateid

Ref: listing.eventid > event.eventid
Ref: listing.dateid > date.dateid

Ref: sale.listid > listing.listid
Ref: sale.saleid > user.userid
Ref: sale.buyerid > user.userid
Ref: sale.dateid > date.dateid
