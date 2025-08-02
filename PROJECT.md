# Requirements

You are seasoned software architect and web developer with skills in UI. I need you to build me online directory that lists retirement homes and senior communities(55+). The directory will allows users to search for retirement homes and senior communities that have desired amenities based on their location that they can indicate by either typing in their address or looking it up on a google map.

# Layout

There will be a header, footer, and a main content area sandwiched between two sidebars.  

## Header

Contains name of the company and the logo and a a navbar that will contain navigable links for Specific Info, Map, Advisor, and Blog pages that will appear in the main content area. 

## Footer

Contains legal disclaimers or ads

## Sidebars

Contains ads.

## Main Content Area

See below.

## Layout Dimensions

The header and footer will each takeup around 15% of the height of the page with the sidebars and main_content area taking up the rest of the height. The header and footer will each occupy 100% of the width. Each sidebar will take up 20% of the width each with main_content area sandwiched in between the two sidebars taking up the other 60%.

# Main Content Area(MCA)

The MCA holds three tabbed divs of the same size-each of these divs is held in a tab. The tabs are as follows: Specific Info, Map, and Advisor. Another div that fits in the MCA but is not tabbed is the Search Results div.

## Specific Info

This section is divided into the following divs that concern the following areas: search address, amenities to search for, and search results.

### Search Address:

Contains labels and textboxes for address, city, state, and zip code. For a search, only zip code is required.

### Search Amenities

The following sections will need to be divided up vertically and horizontally. 

### Section 1-Safety and Monitoring

- 24/7 monitoring
- On-site staff
- On-site nurses and/or physicians
- Medical emergency systems

### Section 2-Physical Amenities

- Gym
- Pool
- Dining halls
- On-site salons
- Communal lounges
- Walking paths
- Gardens

### Section 3-Social and Lifestyle Activities

- Social events
- Classes (art, fitness, computing)
- Clubs
- Field trips
- Cultural activities
- On-demand meals

### Section 3-Levels of Care

- Independent living
- Assisted living
- Memory/dementia care
- 

### Section 4-Specialized Services and Inclusivity

- On-site worship
- LGBTQ+ inclusive

## Map

Contains a map that will mark all entities that conform to the search criteria. There needs to be arrow at the top of the map that will take the user back to the search.

## AI Assistant

Users will be able to type in specific questions that can aid their search.k 

## Search Results Div

 This div will only be visible upon a successful submission. Again only one of the Section Divs will be visible at a time. 

Each result will include the following:

 

- Name of nursing home or community
- Address
- Phone number
- Contact(if available)
- Email(if available)
- Hours(if available)
- Website(if available)
- Company marketing copy(if available)
- Ratings and comments(if available)

Somewhere near the bottom of the ratings will be a statement of clear terms of service that prohibit false reviews.

# Technology Stack
 Let's use Flutter to create the UI. Will worry about the backend later. 