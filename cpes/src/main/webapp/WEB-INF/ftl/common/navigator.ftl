  <header id="main-header">
    <div class="container">
    <div class="main-head">
      <div class="left-side">
        <div class="logo"><a href="index.html"><img src="${APP_PATH}/assets/images/logo.png" alt=""></a></div>
        <nav class="navigation">
          <ul>
            <li><a href="index.html">主页</a></li>
            <li><a href="#">Discover</a>
              <ul class="sub-dropdown">
                <li><a href="listing-grid.html">Grid View</a></li>
                <li><a href="listing.html">List view</a></li>
                <li><a href="detail.html">Detail Page</a></li>
              </ul>
            </li>
            <li><a href="creators.html">Creators</a></li>
            <li><a href="supporters.html">Supporters</a></li>
            <li><a href="#">Pages</a>
              <ul class="sub-dropdown">
                <li><a href="about.html">About us</a></li>
                <li><a href="faq.html">FAQ’s</a></li>
                <li><a href="contect.html">Contect</a></li>
                <li><a href="sign.html">Create an Account</a></li>
                <li><a href="sign.html">Sign In</a></li>
                <li><a href="404.html">404 Page</a></li>
                <li><a href="under.html">under-construction</a></li>
                <li><a href="terms.html">Terms &amp; Conditions</a></li>
                <li><a href="pricing.html">Price &amp; Packges</a></li>
                <li><a href="services.html">Services</a></li>
                <li><a href="site-map.html">Site Map</a></li>
                <li><a href="result.html">Result</a></li>
                <li><a href="donate.html">Donate</a></li>
                <li><a href="user-detail2.html">user detail2</a></li>
              </ul>
            </li>
            <li>
				<a href="#">News</a>
				<ul class="sub-dropdown">
					<li><a href="bloglrag.html">News Listing</a></li>
					<li><a href="blogmedium.html">News Medium</a></li>
					<li><a href="blogdetail.html">News Detail</a></li>
				</ul>
			</li>
          </ul>
        </nav>
      </div>
      <div class="right-side">
        <div class="cs-search-block">
          <form>
            <input type="text" id="s" name="s" value="Search Project" onfocus="if(this.value =='Search Project') { this.value = ''; }" onblur="if(this.value == '') { this.value ='Search Project'; }" class="form-control">
            <label>
              <input type="submit" value="Search">
            </label>
          </form>
        </div>
        <#if memberLogin?if_exists>
        <div class="profile-view">
          <ul>
            <li>
              <img alt="#" src="${APP_PATH}/assets/extra-images/user-img.jpg">
              <i class="icon-arrow-down8"></i>
              <div class="dropdown-area">
                <h5>${memberLogin.name!"未登录账号"}</h5>
                <span>${.now?string('yyyy-MM-dd E')}</span>
                <ul class="dropdown">
                  <li><a href="causes.html"><i class="icon-flag5"></i>My Causes</a></li>
                  <li><a href="saved.html"><i class="icon-file-text-o"></i>Saved Causes</a></li>
                  <li><a href="my-donation.html"><i class="icon-file-text-o"></i>My Donations</a></li>
                  <li><a href="donation.html"><i class="icon-ticket6"></i>Donations</a></li>
                  <li><a href="profilesetting.html"><i class="icon-pie2"></i>Profile Settings</a></li>
                  <li><a href="create-new-cause.html"><i class="icon-plus6"></i>Create New</a></li>
                </ul>
                <a class="sign-btn" href="${APP_PATH}/member/logout.do"><i class="icon-logout"></i>退出</a>
              </div>
            </li>
          </ul>
        </div> 
	    <#else>
	    <a href="${APP_PATH}/sign.htm" class="free-btn">登录</a> </div>
	    </#if>
    </div>
    <div class="mob-nav"></div>
    </div>
  </header>