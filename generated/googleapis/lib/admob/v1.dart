// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: camel_case_types
// ignore_for_file: comment_references
// ignore_for_file: file_names
// ignore_for_file: library_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_interpolation_to_compose_strings
// ignore_for_file: unnecessary_brace_in_string_interps
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: unnecessary_string_interpolations

/// AdMob API - v1
///
/// The AdMob API allows publishers to programmatically get information about
/// their AdMob account.
///
/// For more information, see <https://developers.google.com/admob/api/>
library admob.v1;

import 'dart:async' as async;
import 'dart:convert' as convert;
import 'dart:core' as core;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

import '../src/user_agent.dart';

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

/// The AdMob API allows publishers to programmatically get information about
/// their AdMob account.
class AdmobApi {
  /// See your AdMob data
  static const admobReportScope =
      'https://www.googleapis.com/auth/admob.report';

  final commons.ApiRequester _requester;

  AccountsResourceApi get accounts => AccountsResourceApi(_requester);

  AdmobApi(http.Client client,
      {core.String rootUrl = 'https://admob.googleapis.com/',
      core.String servicePath = ''})
      : _requester =
            commons.ApiRequester(client, rootUrl, servicePath, userAgent);
}

class AccountsResourceApi {
  final commons.ApiRequester _requester;

  AccountsMediationReportResourceApi get mediationReport =>
      AccountsMediationReportResourceApi(_requester);
  AccountsNetworkReportResourceApi get networkReport =>
      AccountsNetworkReportResourceApi(_requester);

  AccountsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Gets information about the specified AdMob publisher account.
  ///
  /// Request parameters:
  ///
  /// [name] - Resource name of the publisher account to retrieve. Example:
  /// accounts/pub-9876543210987654
  /// Value must have pattern "^accounts/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [PublisherAccount].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<PublisherAccount> get(
    core.String name, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => PublisherAccount.fromJson(
          data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Lists the AdMob publisher account accessible with the client credential.
  /// Currently, all credentials have access to at most one AdMob account.
  ///
  /// Request parameters:
  ///
  /// [pageSize] - Maximum number of accounts to return.
  ///
  /// [pageToken] - The value returned by the last
  /// `ListPublisherAccountsResponse`; indicates that this is a continuation of
  /// a prior `ListPublisherAccounts` call, and that the system should return
  /// the next page of data.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListPublisherAccountsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListPublisherAccountsResponse> list({
    core.int pageSize,
    core.String pageToken,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/accounts';

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => ListPublisherAccountsResponse.fromJson(
          data as core.Map<core.String, core.dynamic>),
    );
  }
}

class AccountsMediationReportResourceApi {
  final commons.ApiRequester _requester;

  AccountsMediationReportResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Generates an AdMob Mediation report based on the provided report
  /// specification.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Resource name of the account to generate the report for.
  /// Example: accounts/pub-9876543210987654
  /// Value must have pattern "^accounts/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GenerateMediationReportResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GenerateMediationReportResponse> generate(
    GenerateMediationReportRequest request,
    core.String parent, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/mediationReport:generate';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => GenerateMediationReportResponse.fromJson(
          data as core.Map<core.String, core.dynamic>),
    );
  }
}

class AccountsNetworkReportResourceApi {
  final commons.ApiRequester _requester;

  AccountsNetworkReportResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Generates an AdMob Network report based on the provided report
  /// specification.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Resource name of the account to generate the report for.
  /// Example: accounts/pub-9876543210987654
  /// Value must have pattern "^accounts/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GenerateNetworkReportResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GenerateNetworkReportResponse> generate(
    GenerateNetworkReportRequest request,
    core.String parent, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/networkReport:generate';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => GenerateNetworkReportResponse.fromJson(
          data as core.Map<core.String, core.dynamic>),
    );
  }
}

/// Represents a whole or partial calendar date, e.g. a birthday. The time of
/// day and time zone are either specified elsewhere or are not significant. The
/// date is relative to the Proleptic Gregorian Calendar. This can represent: *
/// A full date, with non-zero year, month and day values * A month and day
/// value, with a zero year, e.g. an anniversary * A year on its own, with zero
/// month and day values * A year and month value, with a zero day, e.g. a
/// credit card expiration date Related types are google.type.TimeOfDay and
/// `google.protobuf.Timestamp`.
class Date {
  /// Day of month. Must be from 1 to 31 and valid for the year and month, or 0
  /// if specifying a year by itself or a year and month where the day is not
  /// significant.
  core.int day;

  /// Month of year. Must be from 1 to 12, or 0 if specifying a year without a
  /// month and day.
  core.int month;

  /// Year of date. Must be from 1 to 9999, or 0 if specifying a date without a
  /// year.
  core.int year;

  Date();

  Date.fromJson(core.Map _json) {
    if (_json.containsKey('day')) {
      day = _json['day'] as core.int;
    }
    if (_json.containsKey('month')) {
      month = _json['month'] as core.int;
    }
    if (_json.containsKey('year')) {
      year = _json['year'] as core.int;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (day != null) {
      _json['day'] = day;
    }
    if (month != null) {
      _json['month'] = month;
    }
    if (year != null) {
      _json['year'] = year;
    }
    return _json;
  }
}

/// Specification of a single date range. Both dates are inclusive.
class DateRange {
  /// End date of the date range, inclusive. Must be greater than or equal to
  /// the start date.
  Date endDate;

  /// Start date of the date range, inclusive. Must be less than or equal to the
  /// end date.
  Date startDate;

  DateRange();

  DateRange.fromJson(core.Map _json) {
    if (_json.containsKey('endDate')) {
      endDate = Date.fromJson(
          _json['endDate'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('startDate')) {
      startDate = Date.fromJson(
          _json['startDate'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (endDate != null) {
      _json['endDate'] = endDate.toJson();
    }
    if (startDate != null) {
      _json['startDate'] = startDate.toJson();
    }
    return _json;
  }
}

/// Request to generate an AdMob Mediation report.
class GenerateMediationReportRequest {
  /// Network report specification.
  MediationReportSpec reportSpec;

  GenerateMediationReportRequest();

  GenerateMediationReportRequest.fromJson(core.Map _json) {
    if (_json.containsKey('reportSpec')) {
      reportSpec = MediationReportSpec.fromJson(
          _json['reportSpec'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (reportSpec != null) {
      _json['reportSpec'] = reportSpec.toJson();
    }
    return _json;
  }
}

/// The streaming response for the AdMob Mediation report where the first
/// response contains the report header, then a stream of row responses, and
/// finally a footer as the last response message. For example: [{ "header": {
/// "date_range": { "start_date": {"year": 2018, "month": 9, "day": 1},
/// "end_date": {"year": 2018, "month": 9, "day": 1} }, "localization_settings":
/// { "currency_code": "USD", "language_code": "en-US" } } }, { "row": {
/// "dimension_values": { "DATE": {"value": "20180918"}, "APP": { "value":
/// "ca-app-pub-8123415297019784~1001342552", "display_label": "My app name!" }
/// }, "metric_values": { "ESTIMATED_EARNINGS": {"decimal_value": "1324746"} } }
/// }, { "footer": {"matching_row_count": 1} }]
class GenerateMediationReportResponse {
  /// Additional information about the generated report, such as warnings about
  /// the data.
  ReportFooter footer;

  /// Report generation settings that describes the report contents, such as the
  /// report date range and localization settings.
  ReportHeader header;

  /// Actual report data.
  ReportRow row;

  GenerateMediationReportResponse();

  GenerateMediationReportResponse.fromJson(core.Map _json) {
    if (_json.containsKey('footer')) {
      footer = ReportFooter.fromJson(
          _json['footer'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('header')) {
      header = ReportHeader.fromJson(
          _json['header'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('row')) {
      row = ReportRow.fromJson(
          _json['row'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (footer != null) {
      _json['footer'] = footer.toJson();
    }
    if (header != null) {
      _json['header'] = header.toJson();
    }
    if (row != null) {
      _json['row'] = row.toJson();
    }
    return _json;
  }
}

/// Request to generate an AdMob Network report.
class GenerateNetworkReportRequest {
  /// Network report specification.
  NetworkReportSpec reportSpec;

  GenerateNetworkReportRequest();

  GenerateNetworkReportRequest.fromJson(core.Map _json) {
    if (_json.containsKey('reportSpec')) {
      reportSpec = NetworkReportSpec.fromJson(
          _json['reportSpec'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (reportSpec != null) {
      _json['reportSpec'] = reportSpec.toJson();
    }
    return _json;
  }
}

/// The streaming response for the AdMob Network report where the first response
/// contains the report header, then a stream of row responses, and finally a
/// footer as the last response message. For example: [{ "header": {
/// "dateRange": { "startDate": {"year": 2018, "month": 9, "day": 1}, "endDate":
/// {"year": 2018, "month": 9, "day": 1} }, "localizationSettings": {
/// "currencyCode": "USD", "languageCode": "en-US" } } }, { "row": {
/// "dimensionValues": { "DATE": {"value": "20180918"}, "APP": { "value":
/// "ca-app-pub-8123415297019784~1001342552", displayLabel: "My app name!" } },
/// "metricValues": { "ESTIMATED_EARNINGS": {"microsValue": 6500000} } } }, {
/// "footer": {"matchingRowCount": 1} }]
class GenerateNetworkReportResponse {
  /// Additional information about the generated report, such as warnings about
  /// the data.
  ReportFooter footer;

  /// Report generation settings that describes the report contents, such as the
  /// report date range and localization settings.
  ReportHeader header;

  /// Actual report data.
  ReportRow row;

  GenerateNetworkReportResponse();

  GenerateNetworkReportResponse.fromJson(core.Map _json) {
    if (_json.containsKey('footer')) {
      footer = ReportFooter.fromJson(
          _json['footer'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('header')) {
      header = ReportHeader.fromJson(
          _json['header'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('row')) {
      row = ReportRow.fromJson(
          _json['row'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (footer != null) {
      _json['footer'] = footer.toJson();
    }
    if (header != null) {
      _json['header'] = header.toJson();
    }
    if (row != null) {
      _json['row'] = row.toJson();
    }
    return _json;
  }
}

/// Response for the publisher account list request.
class ListPublisherAccountsResponse {
  /// Publisher that the client credentials can access.
  core.List<PublisherAccount> account;

  /// If not empty, indicates that there might be more accounts for the request;
  /// you must pass this value in a new `ListPublisherAccountsRequest`.
  core.String nextPageToken;

  ListPublisherAccountsResponse();

  ListPublisherAccountsResponse.fromJson(core.Map _json) {
    if (_json.containsKey('account')) {
      account = (_json['account'] as core.List)
          .map<PublisherAccount>((value) => PublisherAccount.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (account != null) {
      _json['account'] = account.map((value) => value.toJson()).toList();
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    return _json;
  }
}

/// Localization settings for reports, such as currency and language. It affects
/// how metrics are calculated.
class LocalizationSettings {
  /// Currency code of the earning related metrics, which is the 3-letter code
  /// defined in ISO 4217. The daily average rate is used for the currency
  /// conversion. Defaults to the account currency code if unspecified.
  core.String currencyCode;

  /// Language used for any localized text, such as some dimension value display
  /// labels. The language tag defined in the IETF BCP47. Defaults to 'en-US' if
  /// unspecified.
  core.String languageCode;

  LocalizationSettings();

  LocalizationSettings.fromJson(core.Map _json) {
    if (_json.containsKey('currencyCode')) {
      currencyCode = _json['currencyCode'] as core.String;
    }
    if (_json.containsKey('languageCode')) {
      languageCode = _json['languageCode'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (currencyCode != null) {
      _json['currencyCode'] = currencyCode;
    }
    if (languageCode != null) {
      _json['languageCode'] = languageCode;
    }
    return _json;
  }
}

/// The specification for generating an AdMob Mediation report. For example, the
/// specification to get observed ECPM sliced by ad source and app for the 'US'
/// and 'CN' countries can look like the following example: { "date_range": {
/// "start_date": {"year": 2018, "month": 9, "day": 1}, "end_date": {"year":
/// 2018, "month": 9, "day": 30} }, "dimensions": ["AD_SOURCE", "APP",
/// "COUNTRY"], "metrics": ["OBSERVED_ECPM"], "dimension_filters": [ {
/// "dimension": "COUNTRY", "matches_any": {"values": [{"value": "US", "value":
/// "CN"}]} } ], "sort_conditions": [ {"dimension":"APP", order: "ASCENDING"} ],
/// "localization_settings": { "currency_code": "USD", "language_code": "en-US"
/// } } For a better understanding, you can treat the preceding specification
/// like the following pseudo SQL: SELECT AD_SOURCE, APP, COUNTRY, OBSERVED_ECPM
/// FROM MEDIATION_REPORT WHERE DATE >= '2018-09-01' AND DATE <= '2018-09-30'
/// AND COUNTRY IN ('US', 'CN') GROUP BY AD_SOURCE, APP, COUNTRY ORDER BY APP
/// ASC;
class MediationReportSpec {
  /// The date range for which the report is generated.
  DateRange dateRange;

  /// Describes which report rows to match based on their dimension values.
  core.List<MediationReportSpecDimensionFilter> dimensionFilters;

  /// List of dimensions of the report. The value combination of these
  /// dimensions determines the row of the report. If no dimensions are
  /// specified, the report returns a single row of requested metrics for the
  /// entire account.
  core.List<core.String> dimensions;

  /// Localization settings of the report.
  LocalizationSettings localizationSettings;

  /// Maximum number of report data rows to return. If the value is not set, the
  /// API returns as many rows as possible, up to 100000. Acceptable values are
  /// 1-100000, inclusive. Values larger than 100000 return an error.
  core.int maxReportRows;

  /// List of metrics of the report. A report must specify at least one metric.
  core.List<core.String> metrics;

  /// Describes the sorting of report rows. The order of the condition in the
  /// list defines its precedence; the earlier the condition, the higher its
  /// precedence. If no sort conditions are specified, the row ordering is
  /// undefined.
  core.List<MediationReportSpecSortCondition> sortConditions;

  /// A report time zone. Accepts an IANA TZ name values, such as
  /// "America/Los_Angeles." If no time zone is defined, the account default
  /// takes effect. Check default value by the get account action. **Warning:**
  /// The "America/Los_Angeles" is the only supported value at the moment.
  core.String timeZone;

  MediationReportSpec();

  MediationReportSpec.fromJson(core.Map _json) {
    if (_json.containsKey('dateRange')) {
      dateRange = DateRange.fromJson(
          _json['dateRange'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('dimensionFilters')) {
      dimensionFilters = (_json['dimensionFilters'] as core.List)
          .map<MediationReportSpecDimensionFilter>((value) =>
              MediationReportSpecDimensionFilter.fromJson(
                  value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('dimensions')) {
      dimensions = (_json['dimensions'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('localizationSettings')) {
      localizationSettings = LocalizationSettings.fromJson(
          _json['localizationSettings'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('maxReportRows')) {
      maxReportRows = _json['maxReportRows'] as core.int;
    }
    if (_json.containsKey('metrics')) {
      metrics = (_json['metrics'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('sortConditions')) {
      sortConditions = (_json['sortConditions'] as core.List)
          .map<MediationReportSpecSortCondition>((value) =>
              MediationReportSpecSortCondition.fromJson(
                  value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('timeZone')) {
      timeZone = _json['timeZone'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dateRange != null) {
      _json['dateRange'] = dateRange.toJson();
    }
    if (dimensionFilters != null) {
      _json['dimensionFilters'] =
          dimensionFilters.map((value) => value.toJson()).toList();
    }
    if (dimensions != null) {
      _json['dimensions'] = dimensions;
    }
    if (localizationSettings != null) {
      _json['localizationSettings'] = localizationSettings.toJson();
    }
    if (maxReportRows != null) {
      _json['maxReportRows'] = maxReportRows;
    }
    if (metrics != null) {
      _json['metrics'] = metrics;
    }
    if (sortConditions != null) {
      _json['sortConditions'] =
          sortConditions.map((value) => value.toJson()).toList();
    }
    if (timeZone != null) {
      _json['timeZone'] = timeZone;
    }
    return _json;
  }
}

/// Describes which report rows to match based on their dimension values.
class MediationReportSpecDimensionFilter {
  /// Applies the filter criterion to the specified dimension.
  /// Possible string values are:
  /// - "DIMENSION_UNSPECIFIED" : Default value for an unset field. Do not use.
  /// - "DATE" : A date in the YYYY-MM-DD format (for example, "2018-12-21").
  /// Requests can specify at most one time dimension.
  /// - "MONTH" : A month in the YYYY-MM format (for example, "2018-12").
  /// Requests can specify at most one time dimension.
  /// - "WEEK" : The date of the first day of a week in the YYYY-MM-DD format
  /// (for example, "2018-12-21"). Requests can specify at most one time
  /// dimension.
  /// - "AD_SOURCE" : The [unique ID of the ad source](/admob/api/v1/ad_sources)
  /// (for example, "5450213213286189855" and "AdMob Network" as label value).
  /// - "AD_SOURCE_INSTANCE" : The unique ID of the ad source instance (for
  /// example, "ca-app-pub-1234#5678" and "AdMob (default)" as label value).
  /// - "AD_UNIT" : The unique ID of the ad unit (for example,
  /// "ca-app-pub-1234/8790"). If AD_UNIT dimension is specified, then APP is
  /// included automatically.
  /// - "APP" : The unique ID of the mobile application (for example,
  /// "ca-app-pub-1234~1234").
  /// - "MEDIATION_GROUP" : The unique ID of the mediation group (for example,
  /// "ca-app-pub-1234:mg:1234" and "AdMob (default)" as label value).
  /// - "COUNTRY" : CLDR country code of the place where the ad views/clicks
  /// occur (for example, "US" or "FR"). This is a geography dimension.
  /// - "FORMAT" : Format of the ad unit (for example, "banner", "native"), an
  /// ad delivery dimension.
  /// - "PLATFORM" : Mobile OS platform of the app (for example, "Android" or
  /// "iOS").
  core.String dimension;

  /// Matches a row if its value for the specified dimension is in one of the
  /// values specified in this condition.
  StringList matchesAny;

  MediationReportSpecDimensionFilter();

  MediationReportSpecDimensionFilter.fromJson(core.Map _json) {
    if (_json.containsKey('dimension')) {
      dimension = _json['dimension'] as core.String;
    }
    if (_json.containsKey('matchesAny')) {
      matchesAny = StringList.fromJson(
          _json['matchesAny'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dimension != null) {
      _json['dimension'] = dimension;
    }
    if (matchesAny != null) {
      _json['matchesAny'] = matchesAny.toJson();
    }
    return _json;
  }
}

/// Sorting direction to be applied on a dimension or a metric.
class MediationReportSpecSortCondition {
  /// Sort by the specified dimension.
  /// Possible string values are:
  /// - "DIMENSION_UNSPECIFIED" : Default value for an unset field. Do not use.
  /// - "DATE" : A date in the YYYY-MM-DD format (for example, "2018-12-21").
  /// Requests can specify at most one time dimension.
  /// - "MONTH" : A month in the YYYY-MM format (for example, "2018-12").
  /// Requests can specify at most one time dimension.
  /// - "WEEK" : The date of the first day of a week in the YYYY-MM-DD format
  /// (for example, "2018-12-21"). Requests can specify at most one time
  /// dimension.
  /// - "AD_SOURCE" : The [unique ID of the ad source](/admob/api/v1/ad_sources)
  /// (for example, "5450213213286189855" and "AdMob Network" as label value).
  /// - "AD_SOURCE_INSTANCE" : The unique ID of the ad source instance (for
  /// example, "ca-app-pub-1234#5678" and "AdMob (default)" as label value).
  /// - "AD_UNIT" : The unique ID of the ad unit (for example,
  /// "ca-app-pub-1234/8790"). If AD_UNIT dimension is specified, then APP is
  /// included automatically.
  /// - "APP" : The unique ID of the mobile application (for example,
  /// "ca-app-pub-1234~1234").
  /// - "MEDIATION_GROUP" : The unique ID of the mediation group (for example,
  /// "ca-app-pub-1234:mg:1234" and "AdMob (default)" as label value).
  /// - "COUNTRY" : CLDR country code of the place where the ad views/clicks
  /// occur (for example, "US" or "FR"). This is a geography dimension.
  /// - "FORMAT" : Format of the ad unit (for example, "banner", "native"), an
  /// ad delivery dimension.
  /// - "PLATFORM" : Mobile OS platform of the app (for example, "Android" or
  /// "iOS").
  core.String dimension;

  /// Sort by the specified metric.
  /// Possible string values are:
  /// - "METRIC_UNSPECIFIED" : Default value for an unset field. Do not use.
  /// - "AD_REQUESTS" : The number of requests. The value is an integer.
  /// - "CLICKS" : The number of times a user clicks an ad. The value is an
  /// integer.
  /// - "ESTIMATED_EARNINGS" : The estimated earnings of the AdMob publisher.
  /// The currency unit (USD, EUR, or other) of the earning metrics are
  /// determined by the localization setting for currency. The amount is in
  /// micros. For example, $6.50 would be represented as 6500000. Estimated
  /// earnings per mediation group and per ad source instance level is supported
  /// dating back to October 20, 2019. Third-party estimated earnings will show
  /// 0 for dates prior to October 20, 2019.
  /// - "IMPRESSIONS" : The total number of ads shown to users. The value is an
  /// integer.
  /// - "IMPRESSION_CTR" : The ratio of clicks over impressions. The value is a
  /// double precision (approximate) decimal value.
  /// - "MATCHED_REQUESTS" : The number of times ads are returned in response to
  /// a request. The value is an integer.
  /// - "MATCH_RATE" : The ratio of matched ad requests over the total ad
  /// requests. The value is a double precision (approximate) decimal value.
  /// - "OBSERVED_ECPM" : The third-party ad network's estimated average eCPM.
  /// The currency unit (USD, EUR, or other) of the earning metrics are
  /// determined by the localization setting for currency. The amount is in
  /// micros. For example, $2.30 would be represented as 2300000. The estimated
  /// average eCPM per mediation group and per ad source instance level is
  /// supported dating back to October 20, 2019. Third-party estimated average
  /// eCPM will show 0 for dates prior to October 20, 2019.
  core.String metric;

  /// Sorting order of the dimension or metric.
  /// Possible string values are:
  /// - "SORT_ORDER_UNSPECIFIED" : Default value for an unset field. Do not use.
  /// - "ASCENDING" : Sort dimension value or metric value in ascending order.
  /// - "DESCENDING" : Sort dimension value or metric value in descending order.
  core.String order;

  MediationReportSpecSortCondition();

  MediationReportSpecSortCondition.fromJson(core.Map _json) {
    if (_json.containsKey('dimension')) {
      dimension = _json['dimension'] as core.String;
    }
    if (_json.containsKey('metric')) {
      metric = _json['metric'] as core.String;
    }
    if (_json.containsKey('order')) {
      order = _json['order'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dimension != null) {
      _json['dimension'] = dimension;
    }
    if (metric != null) {
      _json['metric'] = metric;
    }
    if (order != null) {
      _json['order'] = order;
    }
    return _json;
  }
}

/// The specification for generating an AdMob Network report. For example, the
/// specification to get clicks and estimated earnings for only the 'US' and
/// 'CN' countries can look like the following example: { 'date_range': {
/// 'start_date': {'year': 2018, 'month': 9, 'day': 1}, 'end_date': {'year':
/// 2018, 'month': 9, 'day': 30} }, 'dimensions': ['DATE', 'APP', 'COUNTRY'],
/// 'metrics': ['CLICKS', 'ESTIMATED_EARNINGS'], 'dimension_filters': [ {
/// 'dimension': 'COUNTRY', 'matches_any': {'values': [{'value': 'US', 'value':
/// 'CN'}]} } ], 'sort_conditions': [ {'dimension':'APP', order: 'ASCENDING'},
/// {'metric':'CLICKS', order: 'DESCENDING'} ], 'localization_settings': {
/// 'currency_code': 'USD', 'language_code': 'en-US' } } For a better
/// understanding, you can treat the preceding specification like the following
/// pseudo SQL: SELECT DATE, APP, COUNTRY, CLICKS, ESTIMATED_EARNINGS FROM
/// NETWORK_REPORT WHERE DATE >= '2018-09-01' AND DATE <= '2018-09-30' AND
/// COUNTRY IN ('US', 'CN') GROUP BY DATE, APP, COUNTRY ORDER BY APP ASC, CLICKS
/// DESC;
class NetworkReportSpec {
  /// The date range for which the report is generated.
  DateRange dateRange;

  /// Describes which report rows to match based on their dimension values.
  core.List<NetworkReportSpecDimensionFilter> dimensionFilters;

  /// List of dimensions of the report. The value combination of these
  /// dimensions determines the row of the report. If no dimensions are
  /// specified, the report returns a single row of requested metrics for the
  /// entire account.
  core.List<core.String> dimensions;

  /// Localization settings of the report.
  LocalizationSettings localizationSettings;

  /// Maximum number of report data rows to return. If the value is not set, the
  /// API returns as many rows as possible, up to 100000. Acceptable values are
  /// 1-100000, inclusive. Values larger than 100000 return an error.
  core.int maxReportRows;

  /// List of metrics of the report. A report must specify at least one metric.
  core.List<core.String> metrics;

  /// Describes the sorting of report rows. The order of the condition in the
  /// list defines its precedence; the earlier the condition, the higher its
  /// precedence. If no sort conditions are specified, the row ordering is
  /// undefined.
  core.List<NetworkReportSpecSortCondition> sortConditions;

  /// A report time zone. Accepts an IANA TZ name values, such as
  /// "America/Los_Angeles." If no time zone is defined, the account default
  /// takes effect. Check default value by the get account action. **Warning:**
  /// The "America/Los_Angeles" is the only supported value at the moment.
  core.String timeZone;

  NetworkReportSpec();

  NetworkReportSpec.fromJson(core.Map _json) {
    if (_json.containsKey('dateRange')) {
      dateRange = DateRange.fromJson(
          _json['dateRange'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('dimensionFilters')) {
      dimensionFilters = (_json['dimensionFilters'] as core.List)
          .map<NetworkReportSpecDimensionFilter>((value) =>
              NetworkReportSpecDimensionFilter.fromJson(
                  value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('dimensions')) {
      dimensions = (_json['dimensions'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('localizationSettings')) {
      localizationSettings = LocalizationSettings.fromJson(
          _json['localizationSettings'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('maxReportRows')) {
      maxReportRows = _json['maxReportRows'] as core.int;
    }
    if (_json.containsKey('metrics')) {
      metrics = (_json['metrics'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('sortConditions')) {
      sortConditions = (_json['sortConditions'] as core.List)
          .map<NetworkReportSpecSortCondition>((value) =>
              NetworkReportSpecSortCondition.fromJson(
                  value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('timeZone')) {
      timeZone = _json['timeZone'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dateRange != null) {
      _json['dateRange'] = dateRange.toJson();
    }
    if (dimensionFilters != null) {
      _json['dimensionFilters'] =
          dimensionFilters.map((value) => value.toJson()).toList();
    }
    if (dimensions != null) {
      _json['dimensions'] = dimensions;
    }
    if (localizationSettings != null) {
      _json['localizationSettings'] = localizationSettings.toJson();
    }
    if (maxReportRows != null) {
      _json['maxReportRows'] = maxReportRows;
    }
    if (metrics != null) {
      _json['metrics'] = metrics;
    }
    if (sortConditions != null) {
      _json['sortConditions'] =
          sortConditions.map((value) => value.toJson()).toList();
    }
    if (timeZone != null) {
      _json['timeZone'] = timeZone;
    }
    return _json;
  }
}

/// Describes which report rows to match based on their dimension values.
class NetworkReportSpecDimensionFilter {
  /// Applies the filter criterion to the specified dimension.
  /// Possible string values are:
  /// - "DIMENSION_UNSPECIFIED" : Default value for an unset field. Do not use.
  /// - "DATE" : A date in the YYYY-MM-DD format (for example, "2018-12-21").
  /// Requests can specify at most one time dimension.
  /// - "MONTH" : A month in the YYYY-MM format (for example, "2018-12").
  /// Requests can specify at most one time dimension.
  /// - "WEEK" : The date of the first day of a week in the YYYY-MM-DD format
  /// (for example, "2018-12-21"). Requests can specify at most one time
  /// dimension.
  /// - "AD_UNIT" : The unique ID of the ad unit (for example,
  /// "ca-app-pub-1234/1234"). If AD_UNIT dimension is specified, then APP is
  /// included automatically.
  /// - "APP" : The unique ID of the mobile application (for example,
  /// "ca-app-pub-1234~1234").
  /// - "AD_TYPE" : Type of the ad (for example, "text" or "image"), an ad
  /// delivery dimension. **Warning:** The dimension is incompatible with
  /// [AD_REQUESTS](#Metric.ENUM_VALUES.AD_REQUESTS),
  /// [MATCH_RATE](#Metric.ENUM_VALUES.MATCH_RATE) and
  /// [IMPRESSION_RPM](#Metric.ENUM_VALUES.IMPRESSION_RPM) metrics.
  /// - "COUNTRY" : CLDR country code of the place where the ad views/clicks
  /// occur (for example, "US" or "FR"). This is a geography dimension.
  /// - "FORMAT" : Format of the ad unit (for example, "banner", "native"), an
  /// ad delivery dimension.
  /// - "PLATFORM" : Mobile OS platform of the app (for example, "Android" or
  /// "iOS").
  core.String dimension;

  /// Matches a row if its value for the specified dimension is in one of the
  /// values specified in this condition.
  StringList matchesAny;

  NetworkReportSpecDimensionFilter();

  NetworkReportSpecDimensionFilter.fromJson(core.Map _json) {
    if (_json.containsKey('dimension')) {
      dimension = _json['dimension'] as core.String;
    }
    if (_json.containsKey('matchesAny')) {
      matchesAny = StringList.fromJson(
          _json['matchesAny'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dimension != null) {
      _json['dimension'] = dimension;
    }
    if (matchesAny != null) {
      _json['matchesAny'] = matchesAny.toJson();
    }
    return _json;
  }
}

/// Sorting direction to be applied on a dimension or a metric.
class NetworkReportSpecSortCondition {
  /// Sort by the specified dimension.
  /// Possible string values are:
  /// - "DIMENSION_UNSPECIFIED" : Default value for an unset field. Do not use.
  /// - "DATE" : A date in the YYYY-MM-DD format (for example, "2018-12-21").
  /// Requests can specify at most one time dimension.
  /// - "MONTH" : A month in the YYYY-MM format (for example, "2018-12").
  /// Requests can specify at most one time dimension.
  /// - "WEEK" : The date of the first day of a week in the YYYY-MM-DD format
  /// (for example, "2018-12-21"). Requests can specify at most one time
  /// dimension.
  /// - "AD_UNIT" : The unique ID of the ad unit (for example,
  /// "ca-app-pub-1234/1234"). If AD_UNIT dimension is specified, then APP is
  /// included automatically.
  /// - "APP" : The unique ID of the mobile application (for example,
  /// "ca-app-pub-1234~1234").
  /// - "AD_TYPE" : Type of the ad (for example, "text" or "image"), an ad
  /// delivery dimension. **Warning:** The dimension is incompatible with
  /// [AD_REQUESTS](#Metric.ENUM_VALUES.AD_REQUESTS),
  /// [MATCH_RATE](#Metric.ENUM_VALUES.MATCH_RATE) and
  /// [IMPRESSION_RPM](#Metric.ENUM_VALUES.IMPRESSION_RPM) metrics.
  /// - "COUNTRY" : CLDR country code of the place where the ad views/clicks
  /// occur (for example, "US" or "FR"). This is a geography dimension.
  /// - "FORMAT" : Format of the ad unit (for example, "banner", "native"), an
  /// ad delivery dimension.
  /// - "PLATFORM" : Mobile OS platform of the app (for example, "Android" or
  /// "iOS").
  core.String dimension;

  /// Sort by the specified metric.
  /// Possible string values are:
  /// - "METRIC_UNSPECIFIED" : Default value for an unset field. Do not use.
  /// - "AD_REQUESTS" : The number of ad requests. The value is an integer.
  /// **Warning:** The metric is incompatible with
  /// [AD_TYPE](#Dimension.ENUM_VALUES.AD_TYPE) dimension.
  /// - "CLICKS" : The number of times a user clicks an ad. The value is an
  /// integer.
  /// - "ESTIMATED_EARNINGS" : The estimated earnings of the AdMob publisher.
  /// The currency unit (USD, EUR, or other) of the earning metrics are
  /// determined by the localization setting for currency. The amount is in
  /// micros. For example, $6.50 would be represented as 6500000.
  /// - "IMPRESSIONS" : The total number of ads shown to users. The value is an
  /// integer.
  /// - "IMPRESSION_CTR" : The ratio of clicks over impressions. The value is a
  /// double precision (approximate) decimal value.
  /// - "IMPRESSION_RPM" : The estimated earnings per thousand ad impressions.
  /// The value is in micros. For example, $1.03 would be represented as
  /// 1030000. **Warning:** The metric is incompatible with
  /// [AD_TYPE](#Dimension.ENUM_VALUES.AD_TYPE) dimension.
  /// - "MATCHED_REQUESTS" : The number of times ads are returned in response to
  /// a request. The value is an integer.
  /// - "MATCH_RATE" : The ratio of matched ad requests over the total ad
  /// requests. The value is a double precision (approximate) decimal value.
  /// **Warning:** The metric is incompatible with
  /// [AD_TYPE](#Dimension.ENUM_VALUES.AD_TYPE) dimension.
  /// - "SHOW_RATE" : The ratio of ads that are displayed over ads that are
  /// returned, defined as impressions / matched requests. The value is a double
  /// precision (approximate) decimal value.
  core.String metric;

  /// Sorting order of the dimension or metric.
  /// Possible string values are:
  /// - "SORT_ORDER_UNSPECIFIED" : Default value for an unset field. Do not use.
  /// - "ASCENDING" : Sort dimension value or metric value in ascending order.
  /// - "DESCENDING" : Sort dimension value or metric value in descending order.
  core.String order;

  NetworkReportSpecSortCondition();

  NetworkReportSpecSortCondition.fromJson(core.Map _json) {
    if (_json.containsKey('dimension')) {
      dimension = _json['dimension'] as core.String;
    }
    if (_json.containsKey('metric')) {
      metric = _json['metric'] as core.String;
    }
    if (_json.containsKey('order')) {
      order = _json['order'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dimension != null) {
      _json['dimension'] = dimension;
    }
    if (metric != null) {
      _json['metric'] = metric;
    }
    if (order != null) {
      _json['order'] = order;
    }
    return _json;
  }
}

/// A publisher account contains information relevant to the use of this API,
/// such as the time zone used for the reports.
class PublisherAccount {
  /// Currency code of the earning-related metrics, which is the 3-letter code
  /// defined in ISO 4217. The daily average rate is used for the currency
  /// conversion.
  core.String currencyCode;

  /// Resource name of this account. Format is accounts/{publisher_id}.
  core.String name;

  /// The unique ID by which this publisher account can be identified in the API
  /// requests (for example, pub-1234567890).
  core.String publisherId;

  /// The time zone that is used in reports that are generated for this account.
  /// The value is a time-zone ID as specified by the CLDR project, for example,
  /// "America/Los_Angeles".
  core.String reportingTimeZone;

  PublisherAccount();

  PublisherAccount.fromJson(core.Map _json) {
    if (_json.containsKey('currencyCode')) {
      currencyCode = _json['currencyCode'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('publisherId')) {
      publisherId = _json['publisherId'] as core.String;
    }
    if (_json.containsKey('reportingTimeZone')) {
      reportingTimeZone = _json['reportingTimeZone'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (currencyCode != null) {
      _json['currencyCode'] = currencyCode;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (publisherId != null) {
      _json['publisherId'] = publisherId;
    }
    if (reportingTimeZone != null) {
      _json['reportingTimeZone'] = reportingTimeZone;
    }
    return _json;
  }
}

/// Groups data available after report generation, for example, warnings and row
/// counts. Always sent as the last message in the stream response.
class ReportFooter {
  /// Total number of rows that matched the request. Warning: This count does
  /// NOT always match the number of rows in the response. Do not make that
  /// assumption when processing the response.
  core.String matchingRowCount;

  /// Warnings associated with generation of the report.
  core.List<ReportWarning> warnings;

  ReportFooter();

  ReportFooter.fromJson(core.Map _json) {
    if (_json.containsKey('matchingRowCount')) {
      matchingRowCount = _json['matchingRowCount'] as core.String;
    }
    if (_json.containsKey('warnings')) {
      warnings = (_json['warnings'] as core.List)
          .map<ReportWarning>((value) => ReportWarning.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (matchingRowCount != null) {
      _json['matchingRowCount'] = matchingRowCount;
    }
    if (warnings != null) {
      _json['warnings'] = warnings.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// Groups data helps to treat the generated report. Always sent as a first
/// message in the stream response.
class ReportHeader {
  /// The date range for which the report is generated. This is identical to the
  /// range specified in the report request.
  DateRange dateRange;

  /// Localization settings of the report. This is identical to the settings in
  /// the report request.
  LocalizationSettings localizationSettings;

  /// The report time zone. The value is a time-zone ID as specified by the CLDR
  /// project, for example, "America/Los_Angeles".
  core.String reportingTimeZone;

  ReportHeader();

  ReportHeader.fromJson(core.Map _json) {
    if (_json.containsKey('dateRange')) {
      dateRange = DateRange.fromJson(
          _json['dateRange'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('localizationSettings')) {
      localizationSettings = LocalizationSettings.fromJson(
          _json['localizationSettings'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('reportingTimeZone')) {
      reportingTimeZone = _json['reportingTimeZone'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dateRange != null) {
      _json['dateRange'] = dateRange.toJson();
    }
    if (localizationSettings != null) {
      _json['localizationSettings'] = localizationSettings.toJson();
    }
    if (reportingTimeZone != null) {
      _json['reportingTimeZone'] = reportingTimeZone;
    }
    return _json;
  }
}

/// A row of the returning report.
class ReportRow {
  /// Map of dimension values in a row, with keys as enum name of the
  /// dimensions.
  core.Map<core.String, ReportRowDimensionValue> dimensionValues;

  /// Map of metric values in a row, with keys as enum name of the metrics. If a
  /// metric being requested has no value returned, the map will not include it.
  core.Map<core.String, ReportRowMetricValue> metricValues;

  ReportRow();

  ReportRow.fromJson(core.Map _json) {
    if (_json.containsKey('dimensionValues')) {
      dimensionValues = (_json['dimensionValues'] as core.Map)
          .cast<core.String, core.Map>()
          .map(
            (key, item) => core.MapEntry(
              key,
              ReportRowDimensionValue.fromJson(
                  item as core.Map<core.String, core.dynamic>),
            ),
          );
    }
    if (_json.containsKey('metricValues')) {
      metricValues =
          (_json['metricValues'] as core.Map).cast<core.String, core.Map>().map(
                (key, item) => core.MapEntry(
                  key,
                  ReportRowMetricValue.fromJson(
                      item as core.Map<core.String, core.dynamic>),
                ),
              );
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dimensionValues != null) {
      _json['dimensionValues'] =
          dimensionValues.map((key, item) => core.MapEntry(key, item.toJson()));
    }
    if (metricValues != null) {
      _json['metricValues'] =
          metricValues.map((key, item) => core.MapEntry(key, item.toJson()));
    }
    return _json;
  }
}

/// Representation of a dimension value.
class ReportRowDimensionValue {
  /// The localized string representation of the value. If unspecified, the
  /// display label should be derived from the value.
  core.String displayLabel;

  /// Dimension value in the format specified in the report's spec Dimension
  /// enum.
  core.String value;

  ReportRowDimensionValue();

  ReportRowDimensionValue.fromJson(core.Map _json) {
    if (_json.containsKey('displayLabel')) {
      displayLabel = _json['displayLabel'] as core.String;
    }
    if (_json.containsKey('value')) {
      value = _json['value'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (displayLabel != null) {
      _json['displayLabel'] = displayLabel;
    }
    if (value != null) {
      _json['value'] = value;
    }
    return _json;
  }
}

/// Representation of a metric value.
class ReportRowMetricValue {
  /// Double precision (approximate) decimal values. Rates are from 0 to 1.
  core.double doubleValue;

  /// Metric integer value.
  core.String integerValue;

  /// Amount in micros. One million is equivalent to one unit. Currency value is
  /// in the unit (USD, EUR or other) specified by the request. For example,
  /// $6.50 whould be represented as 6500000 micros.
  core.String microsValue;

  ReportRowMetricValue();

  ReportRowMetricValue.fromJson(core.Map _json) {
    if (_json.containsKey('doubleValue')) {
      doubleValue = (_json['doubleValue'] as core.num).toDouble();
    }
    if (_json.containsKey('integerValue')) {
      integerValue = _json['integerValue'] as core.String;
    }
    if (_json.containsKey('microsValue')) {
      microsValue = _json['microsValue'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (doubleValue != null) {
      _json['doubleValue'] = doubleValue;
    }
    if (integerValue != null) {
      _json['integerValue'] = integerValue;
    }
    if (microsValue != null) {
      _json['microsValue'] = microsValue;
    }
    return _json;
  }
}

/// Warnings associated with generation of the report.
class ReportWarning {
  /// Describes the details of the warning message, in English.
  core.String description;

  /// Type of the warning.
  /// Possible string values are:
  /// - "TYPE_UNSPECIFIED" : Default value for an unset field. Do not use.
  /// - "DATA_BEFORE_ACCOUNT_TIMEZONE_CHANGE" : Some data in this report is
  /// aggregated based on a time zone different from the requested time zone.
  /// This could happen if a local time-zone report has the start time before
  /// the last time this time zone changed. The description field will contain
  /// the date of the last time zone change.
  /// - "DATA_DELAYED" : There is an unusual delay in processing the source data
  /// for the requested date range. The report results might be less up to date
  /// than usual. AdMob is aware of the issue and is actively working to resolve
  /// it.
  /// - "OTHER" : Warnings that are exposed without a specific type. Useful when
  /// new warning types are added but the API is not changed yet.
  /// - "REPORT_CURRENCY_NOT_ACCOUNT_CURRENCY" : The currency being requested is
  /// not the account currency. The earning metrics will be based on the
  /// requested currency, and thus not a good estimation of the final payment
  /// anymore, due to the currency rate fluctuation.
  core.String type;

  ReportWarning();

  ReportWarning.fromJson(core.Map _json) {
    if (_json.containsKey('description')) {
      description = _json['description'] as core.String;
    }
    if (_json.containsKey('type')) {
      type = _json['type'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (description != null) {
      _json['description'] = description;
    }
    if (type != null) {
      _json['type'] = type;
    }
    return _json;
  }
}

/// List of string values.
class StringList {
  /// The string values.
  core.List<core.String> values;

  StringList();

  StringList.fromJson(core.Map _json) {
    if (_json.containsKey('values')) {
      values = (_json['values'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (values != null) {
      _json['values'] = values;
    }
    return _json;
  }
}
