<!DOCTYPE xsl:stylesheet PUBLIC "-//FreeBSD//DTD FreeBSD XSLT 1.0 DTD//EN"
				"http://www.FreeBSD.org/XML/www/share/sgml/xslt10-freebsd.dtd" [
<!ENTITY base "..">
<!ENTITY title "The FreeBSD GNOME Project">
<!ENTITY % navinclude.gnome "INCLUDE">
]>
<!-- $FreeBSD: www/en/gnome/index.xsl,v 1.93 2007/03/19 17:36:33 marcus Exp $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:rdf1="http://my.netscape.com/rdf/simple/0.9/"
		exclude-result-prefixes="rdf rdf1" version="1.0">

  <xsl:import href="http://www.FreeBSD.org/XML/www/lang/share/sgml/libcommon.xsl"/>

  <xsl:output type="html" encoding="&xml.encoding;"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

  <xsl:template match="/">
    <html>
      &header1;
      <body>

	<div id="CONTAINERWRAP">
	  <div id="CONTAINER">
	    &header2;

	    <div id="CONTENT">
              <div id="SIDEWRAP">
                &nav;
              </div> <!-- SIDEWRAP -->

	      <div id="CONTENTWRAP">
		<div id="rightwrap">
		  <div class="rightnav">

		    <h2>FreeBSD GNOME News</h2>

		    <p>Latest update:
		      <xsl:value-of
			select="descendant::month[position() = 1]/name"/>
		      <xsl:text> </xsl:text>
		      <xsl:value-of
			select="descendant::day[position() = 1]/name"/>,
		      <xsl:text> </xsl:text>
		      <xsl:value-of
			select="descendant::year[position() = 1]/name"/></p>
		    <ul>

		      <!-- Pull in the 10 most recent news items -->
		      <xsl:for-each select="descendant::event[position() &lt;= 10]">
			<li><a>
			    <xsl:attribute name="href">
			      newsflash.html#<xsl:call-template name="generate-event-anchor"/>
			    </xsl:attribute>
			    <xsl:choose>
			      <xsl:when test="count(child::title)">
				<xsl:value-of select="title"/><br/>
			      </xsl:when>
			      <xsl:otherwise>
				<xsl:value-of select="p"/><br/>
			      </xsl:otherwise>
			    </xsl:choose>
			  </a></li>
		      </xsl:for-each>
		      <li><a href="newsflash.html">More...</a></li>
		    </ul>
		  </div> <!-- rightnav -->

		  <br />

		  <div class="rightnav">

		    <h2>GNOME Project News</h2>
		    <ul>
		      <xsl:for-each select="document('http://gnomedesktop.org/node/feed')/rss/channel/*[name() = 'item'][position() &lt; 10]">
			<li><a>
			    <xsl:attribute name="href">
			      <xsl:value-of select="link"/>
			    </xsl:attribute>
			    <xsl:value-of select="title"/><br/>
			  </a></li>
		      </xsl:for-each>
		      <li><a>
			  <xsl:for-each select="document('http://gnomedesktop.org/backend.php')/rss/*[name() = 'channel'][position() = 1]">
			    <xsl:attribute name="href">
			      <xsl:value-of select="link"/>
			    </xsl:attribute>More...
			  </xsl:for-each>
			</a></li>
		    </ul>
                  </div> <!-- rightnav -->
                </div> <!-- rightwrap -->

		&header3;

		<h2>What is GNOME?</h2>

		<img src="&base;/gnome/images/gnome.png" align="right"
                   border="0" alt="GNOME Logo"/>

	       		<p>GNOME is a complete desktop environment, and a
			   comprehensive suite of applications. In GNOME,
			   everything is easy to use, attractive, powerful,
			   and works the way you expect.</p>

			 <p>The
			   <a href="http://www.gnome.org">GNOME
			     desktop</a> is a window-based desktop
			   environment that provides many business,
			   productivity, and entertainment
			   applications, and makes non-GNOME programs
			   faster and easier to run. The
			  <a href="http://developer.gnome.org">GNOME development
			    platform</a> is a collection of
			  application-development tools and libraries
			  used by many programs, such as <a
			    href="http://www.firefox.com">Mozilla
			    Firefox</a>.</p>

		       <p>The FreeBSD GNOME Project is a team of devoted
			 developers and users that manage the
			 integration of GNOME and FreeBSD.</p>

		<h2>Upgrading to GNOME 2.18?</h2>

		<p>If you are upgrading from GNOME 2.16 to GNOME 2.18, read the
		  <a href="docs/faq218.html">Upgrade FAQ</a> for upgrade
		  instructions.</p>

              <h2>State of the port</h2>

	      <p>GNOME for FreeBSD is currently supported on
		5-STABLE, 6-STABLE, 7-CURRENT, 5.5, 6.1, and 6.2.
		Most of GNOME has been ported to FreeBSD, but there is still
		<a href="docs/volunteer.html">plenty left to be done</a>!</p>

	      <h2>One stop solution shop!</h2>

	      <p>GNOME is simple and easy to build using the FreeBSD ports system, but
	        sometimes things simply go wrong. If GNOME -- or anything that uses
		GNOME libraries -- is not building the way it should, simply run the
		<a href="/gnome/gnomelogalyzer.sh">gnomelogalyzer.sh</a>
		tool from the directory of the failed port, and let the gnomelogalyzer
		figure out what's wrong and how to fix it!</p>

		<h2>Resources</h2>
		<ul>
		  <li><a href="http://www.gnome.org/">GNOME Project</a></li>
		  <li><a href="http://gnomedesktop.org">FootNotes</a></li>
		  <li><a href="http://www.gnomejournal.org">GNOME Journal</a></li>
		  <li><a
		      href="http://www.gnomefiles.org">GNOME
		      Files</a></li>
		  <li><a href="http://gnu-darwin.sourceforge.net/GNOME/">GNOME on GNU/Darwin</a></li>
		</ul>

		<h2>Related Projects</h2>
		<ul>
		  <li><a href="http://www.kde.org/">KDE Project</a></li>
		  <li><a href="http://freebsd.kde.org/">KDE on FreeBSD</a></li>
		  <li><a href="http://www.opengroup.org/desktop/">CDE (commercial)</a></li>
		</ul>

		<a id="search" name="search"></a>
		<form action="http://freebsd.rambler.ru/srch" method="get">
		  <p>Search the freebsd-gnome mailing list archives:</p>
		  <input type="text" name="words" size="25"/>
		  <input type="hidden" name="rubric" value="122" />
		  <input type="submit" value="Search"/>
		</form>

	  	</div> <!-- contentwrap -->

	      <br class="clearboth" />
	    </div> <!-- content -->
            <div id="FOOTER">
	      &copyright;<br />
	      &date;
            </div> <!-- FOOTER -->
	  </div> <!-- container -->
	</div> <!-- containerwrap -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
