<div class="account">
  <!-- IMPORT partials/account_menu.tpl -->
<div class="alert alert-warning text-center"<!-- IF tips.length --> style="display: none;"<!-- END -->>[[user:has_no_tips]]</div>
  <div class="row">
    <div class="col-xs-12 col-md-12">
      <p class="lead">[[user:tips.description]]</p>
      <hr />
      <table class="table">
        <thead>
        <tr>
            <th scope="col">[[tips:from]]</th>
            <th scope="col">[[tips:date]]</th>
            <th scope="col">[[tips:amount]]</th>
            <th scope="col">[[tips:coin]]</th>
            <th scope="col">[[tips:transaction]]</th>
        </tr>
        </thead>
        <tbody>
        {{{each tips}}}
        <tr>
            <th scope="row"></td><a href="{config.relative_path}/user/{tips.from_username}">{tips.from_username}</a></td>
            <td>{tips.date}</td>
            <td>{tips.value}</td>
            <td>{tips.coin}</td>
            <td><a href="https://etherscan.io/tx/{tips.thash}" target="_blank">{tips.thash}</a></td>
          </tr>
        {{{end}}}
        </tbody>
    </table>

    </div>
  </div>
</div>
