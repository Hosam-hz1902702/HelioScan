import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'elections_page_model.dart';
export 'elections_page_model.dart';
import '../welcome_page/welcome_page_widget.dart';

class ElectionsPageWidget extends StatefulWidget {
  const ElectionsPageWidget({
    super.key,
    String? qrCodeResult,
  }) : this.qrCodeResult = qrCodeResult ?? 'None';

  final String qrCodeResult;

  @override
  State<ElectionsPageWidget> createState() => _ElectionsPageWidgetState();
}

class _ElectionsPageWidgetState extends State<ElectionsPageWidget>
    with TickerProviderStateMixin {
  late ElectionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ElectionsPageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.08),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(67.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HelioScan',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/1708180515831-Standard.png',
                      width: MediaQuery.sizeOf(context).width * 0.136,
                      fit: BoxFit.cover,
                    ),
                  ),
                ].divide(SizedBox(width: 5.0)),
              ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 1.0,
                buttonSize: MediaQuery.sizeOf(context).width * 0.172,
                fillColor: FlutterFlowTheme.of(context).alternate,
                icon: Icon(
                  Icons.qr_code_scanner_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 45.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');

                },
              ),
            ],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
StreamBuilder<List<ElectionRecord>>(
  stream: queryElectionRecord(
  queryBuilder: (electionRecord) => electionRecord.orderBy(
      'createdAt',
      descending: true, // Order by timestamp field in descending order
    ), ),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            FlutterFlowTheme.of(context).primary,
          ),
        ),
      );
    }

    if (snapshot.hasError) {
      return Center(
        child: Text('Error: ${snapshot.error}'),
      );
    }

    List<ElectionRecord> listViewElectionRecordList = snapshot.data!;
    return ListView.builder(
  padding: EdgeInsets.zero,
  shrinkWrap: true,
  scrollDirection: Axis.vertical,
  itemCount: listViewElectionRecordList.length,
  itemBuilder: (context, listViewIndex) {
    final listViewElectionRecord = listViewElectionRecordList[listViewIndex];
    return GestureDetector(
      onTap: () {
        // Capture the selected ElectionRecord here
        ElectionRecord selectedElection = listViewElectionRecord;
        // Navigate to the next screen and pass the selected ElectionRecord
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomePageWidget(election: selectedElection),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: Color(0xFFE0E3E7),
                offset: Offset(0.0, 1.0),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          listViewElectionRecord.electionName,
                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF14181B),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF1F4F8),
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0xFF57636C),
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  },
);


  },
),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


    // return ListView.builder(
    //   padding: EdgeInsets.zero,
    //   shrinkWrap: true,
    //   itemCount: listViewElectionRecordList.length,
    //   itemBuilder: (context, index) {
    //     final listViewElectionRecord = listViewElectionRecordList[index];
    //     return GestureDetector(
    //       onTap: () {
    //         // Handle onTap event here
    //         // For example, navigate to a new page with the selected election details
    //       },
    //       child: Padding(
    //         padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
    //         child: Container(
    //           // Display the electionName based on the document ID
    //           child: Text(listViewElectionRecord.electionName),
    //         ),
    //       ),
    //     );
    //   },
    // );