<div class="account">
	<!-- IMPORT partials/account_menu.tpl -->
	<div class="row">
		<div class="col-md-5 account-block">

			<div class="account-picture-block panel panel-default">
				<div class="panel-body">
					<div class="text-center">
						<!-- IF picture -->
						<img src="{picture}" class="user-profile-picture" />
						<!-- ELSE -->
						<div class="user-icon user-profile-picture" style="background-color: {icon:bgColor};" title="{username}">{icon:text}</div>
						<!-- ENDIF picture -->
					</div>

					<div>
						<div class="text-center">
							<span>
								<i component="user/status" class="fa fa-circle status {status}" title="[[global:{status}]]"></i>
								<span class="account-username"> {username}</span>
							</span>

							<!-- IF !isSelf -->
							<br/>
							<!-- IF !config.disableChat -->
							<a component="account/chat" href="#" class="btn btn-primary btn-sm">[[user:chat]]</a>
							<!-- ENDIF !config.disableChat -->
 							<a component="account/follow" href="#" class="btn btn-success btn-sm <!-- IF isFollowing -->hide<!-- ENDIF isFollowing -->">[[user:follow]]</a>
 							<a component="account/unfollow" href="#" class="btn btn-warning btn-sm <!-- IF !isFollowing -->hide<!-- ENDIF !isFollowing -->">[[user:unfollow]]</a>


							<button type="button" class="btn btn-primary open-sendTipModal" data-toggle="modal" data-target="#sendCryptoModalCenter">
							  [[user:tip]]
							</button>

							<!-- IF canBan -->
							<br/><br/>
							<a component="account/ban" href="#" class="btn btn-danger btn-sm <!-- IF banned -->hide<!-- ENDIF banned -->">[[user:ban_account]]</a>
							<a component="account/unban" href="#" class="btn btn-danger btn-sm <!-- IF !banned -->hide<!-- ENDIF !banned -->">[[user:unban_account]]</a>
							<!-- ENDIF canBan -->
							<!-- IF isAdmin -->
							<a component="account/delete" href="#" class="btn btn-danger btn-sm">[[user:delete_account]]</a><br/><br/>
							<!-- ENDIF isAdmin -->
							<!-- ENDIF !isSelf -->

						</div>

						<div id="banLabel" class="text-center <!-- IF !banned -->hide<!-- ENDIF !banned -->">
							<span class="label label-danger">[[user:banned]]</span>
						</div>

						<!-- IF aboutme -->
						<hr/>
						<div component="aboutme" class="text-center">
						{aboutmeParsed}
						</div>
						<!-- ENDIF aboutme -->
						<hr/>
						<div class="text-center account-stats">

							<!-- IF !reputation:disabled -->
							<div class="inline-block text-center">
								<span class="human-readable-number" title="{reputation}">{reputation}</span>
								<span class="account-bio-label">[[global:reputation]]</span>
							</div>
							<!-- ENDIF !reputation:disabled -->

							<div class="inline-block text-center">
								<span class="human-readable-number" title="{postcount}">{postcount}</span>
								<span class="account-bio-label">[[global:posts]]</span>
							</div>

							<div class="inline-block text-center">
								<span class="human-readable-number" title="{profileviews}">{profileviews}</span>
								<span class="account-bio-label">[[user:profile_views]]</span>
							</div>
						</div>

					</div>
				</div>
			</div>


			<div class="panel panel-default">
				<div class="panel-body text-center">

					<!-- IF email -->
					<span class="account-bio-label">[[user:email]]</span>
					<span class="account-bio-value"><i class="fa fa-eye-slash {emailClass}" title="[[user:email_hidden]]"></i> {email}</span>
					<!-- ENDIF email -->

					<!-- IF fullname -->
					<span class="account-bio-label">[[user:fullname]]</span>
					<span class="account-bio-value">{fullname}</span>
					<!-- ENDIF fullname -->

					<!-- IF websiteName -->
					<span class="account-bio-label">[[user:website]]</span>
					<span class="account-bio-value"><a href="{websiteLink}" rel="nofollow noopener noreferrer">{websiteName}</a></span>
					<!-- ENDIF websiteName -->

					<!-- IF location -->
					<span class="account-bio-label">[[user:location]]</span>
					<span class="account-bio-value">{location}</span>
					<!-- ENDIF location -->

					<!-- IF age -->
					<span class="account-bio-label">[[user:age]]</span>
					<span class="account-bio-value">{age}</span>
					<!-- ENDIF age -->
					
					<span class="account-bio-label">[[user:followers]]</span>
					<span class="human-readable-number account-bio-value" title="{followerCount}">{followerCount}</span>

					<span class="account-bio-label">[[user:following]]</span>
					<span class="human-readable-number account-bio-value"  title="{followingCount}">{followingCount}</span>

					<span class="account-bio-label">[[user:joined]]</span>
					<span class="timeago account-bio-value" title="{joindateISO}"></span>

					<span class="account-bio-label">[[user:lastonline]]</span>
					<span class="timeago account-bio-value" title="{lastonlineISO}"></span>

					<!-- IF !disableSignatures -->
					<!-- IF signature -->
					<hr/>
					<span class="account-bio-label">[[user:signature]]</span>
					<div class="post-signature">
						<span id='signature'>{signature}</span>
					</div>
					<!-- ENDIF signature -->
					<!-- ENDIF !disableSignatures -->
				</div>
			</div>

			<!-- IF groups.length -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">[[groups:groups]]</h3>
				</div>
				<div class="panel-body">
				{{{each groups}}}
					<a href="{config.relative_path}/groups/{groups.slug}"><span class="label group-label inline-block" style="background-color: {groups.labelColor};"><!-- IF groups.icon --><i class="fa {groups.icon}"></i> <!-- ENDIF groups.icon -->{groups.userTitle}</span></a>
				{{{end}}}
				</div>
			</div>
			<!-- ENDIF groups.length -->

		</div>

		<div class="col-md-7">
		<!-- IF !posts.length -->
		<div class="alert alert-warning">[[user:has_no_posts]]</div>
		<!-- ENDIF !posts.length -->
		<!-- IMPORT partials/posts_list.tpl -->

		</div>
	</div>

	<br/>
	<div id="user-action-alert" class="alert alert-success hide"></div>

<!-- Modal -->
<div class="modal fade" id="sendCryptoModalCenter" tabindex="-1" role="dialog" aria-labelledby="sendCryptoModalCenter" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">[[topic:send_crypto_tip]]</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <p>[[topic:message_about_to_send]]  <span class="account-username"> {username}</span></p>
          <p>[[topic:wallet_address]]<span id="postEthereumWallet">[[topic:user_no_config_wallet]]</span></p>
          <form onsubmit="return false">
           <label for="ethValue" class="col-lg-2 control-label">[[topic:crypto_amount_to_send]]</label>
           <input id="ethValue" type="text" placeholder="0.005">
           <br />
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">[[topic:modal_close]]</button>
        <a component="account/tip" id="sendcrypto" href="#" class="btn btn-primary">[[topic:modal_send]]</a>
      </div>
    </div>
  </div>
</div>

</div>
