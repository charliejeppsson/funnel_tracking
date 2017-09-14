<h1>Funnel tracking assignment</h1>

<h2>Description</h2>
<p>
  Simple project created on instructions in assignment given by Funnel as part
  of their interview process. The main objective was to code a tracking pixel
  for the purpose of gathering page view data, in either Ruby, Java or Python.
  My choice fell upon Ruby, within the Ruby on Rails framework, hence creating
  the project as an MVC app.
</p>
<p>
  As Rails was chosen, in the pursuit of following the Rails conventions, I
  chose to divert slightly from the requirements. Hence, I did not create any
  actual < img > tags to store the cookie data in, but instead put that
  responsibility on the create_cookie method in the PagesController.
</p>
<p>
  The logic of the project in short: when either of the two routes in the app,
  "/" or "/contact", gets an http request, a cookie is stored in the visitor's
  browser with a timestamp, the url requested and a unique visitor id. If the
  visit to the page is the first from the user, a new Visitor record is also
  stored in the relational database (ActiveRecord/PostgreSQL), with a unique
  visitor id (which is the same integer being stored in the cookie). If the
  visit is not the first, the visitor id is fetched from the last cookie stored
  in the user's browser. Then, both for first visit requests and recurring visit
  requests, a new Visit record is stored in the database, with attributes
  timestamp, url and visitor id (which is a foreign key linking the Visit record
  to the right Visitor record).
</p>

<h2>Displaying page view statistics</h2>
<p>
  As all visitors and visits are recorded in the ActiveRecord database, the
  simplest way to search and display page view statistics is with ActiveRecord
  commands in the Rails console. First, run:

  <pre><code>rails c</code></pre>

  in the terminal to enter the Rails console. Then, for example, the page views
  that occurred between 2017-09-14 09:00 to 2017-09-14 11:00 can be searched and
  displayed by running:
  <pre><code>Visit.where(timestamp: ('2017-09-14 09:00:00 +0200').to_datetime..('2017-09-14 11:00:00 +0200').to_datetime)</code></pre>

  The whole list of query options can be found <a href="http://guides.rubyonrails.org/v3.2/active_record_querying.html">here</a>.
</p>

<h2>How to build and run</h2>
<p>
  Assuming Ruby, Rails and git are installed, download the project repository by
  running:
  <pre><code>git clone https://github.com/charliejeppsson/funnel_tracking.git</code></pre>

  Then run
  <pre><code>bundle install</code></pre>
  to install dependencies specified in the file gemfile.rb. The command for
  running a local server on http://localhost:3000 is:
  <pre><code>rails s</code></pre>
  and for running tests:
  <pre><code>. rspec</code></pre>
</p>

<h2>How to test</h2>
<p>
  I decided to implement the testing with the testing framework
  <a href="https://github.com/rspec/rspec-rails">RSpec</a>. It is one of the
  most widely used BDD testing tools for Ruby code and has solid documentation.

  As this is a small project, I decided to only include four tests, all for the
  essential methods in the PagesController. They can be found in
  spec/requests/pages_controller_spec.rb and include:

  <ul>
    <li>Test that the set_visitor_id method creates a visitor record in the
    relational database if a user visits the page for the first time</li>
    <li>Test that the set_visitor_id method sets a visitor id as an integer</li>
    <li>Test that the create_cookie method creates a visit cookie in the
    visitor's browser</li>
    <li>Test that the create_cookie method creates a visit record in the
    relational database</li>
  </ul>

  The testing dependencies are brought into the project by running:
  <pre><code>bundle install</code></pre>
  in the terminal. To then run the tests, run:
  <pre><code>. rspec</code></pre>
  in the terminal from the project directory.
</p>
