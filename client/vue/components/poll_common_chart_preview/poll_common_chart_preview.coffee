{ fieldFromTemplate, myLastStanceFor } = require 'shared/helpers/poll'
LmoUrlService = require 'shared/services/lmo_url_service'

module.exports = Vue.component 'PollCommonChartPreview',
  props:
    poll: Object
  methods:
    urlFor: (model) -> LmoUrlService.route(model: model)
  computed:
    chartType: -> fieldFromTemplate(this.poll.pollType, 'chart_type')
    myStance: -> myLastStanceFor(this.poll)
  template: """
<div class="poll-common-chart-preview">
  <bar-chart
    v-if="chartType == \'bar\'"
    :stance-counts="this.poll.stanceCounts"
    size="50"
  ></bar-chart>

  <progress-chart
    v-if="chartType == \'progress\'"
    :stance-counts="this.poll.stanceCounts"
    :goal="this.poll.goal()"
    size="50"
  ></progress-chart>
  <!-- <poll_proposal_chart_preview ng-if="chartType() == \'pie\'" stance_counts="poll.stanceCounts" my_stance="myStance()"></poll_proposal_chart_preview>
  <matrix_chart ng-if="chartType() == \'matrix\'" matrix_counts="poll.matrixCounts" size="50"></matrix_chart> -->
</div>
"""