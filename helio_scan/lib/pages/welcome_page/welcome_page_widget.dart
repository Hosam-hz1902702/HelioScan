import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_page_model.dart';
export 'welcome_page_model.dart';
import '../../backend/schema/election_record.dart';
import  '../../backend/schema/ballot_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({
    Key? key,
    this.qrCodeResult, // Nullable QR code result
    this.election, // Nullable election object
  }) : super(key: key);

  final String? qrCodeResult; // Nullable QR code result
  final ElectionRecord? election; // Nullable election object

  @override
  State<WelcomePageWidget> createState() => _WelcomePageWidgetState();
}


// class _WelcomePageWidgetState extends State<WelcomePageWidget> {
//   late WelcomePageModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => WelcomePageModel());

//     WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         appBar: PreferredSize(
//           preferredSize:
//               Size.fromHeight(MediaQuery.sizeOf(context).height * 0.08),
//           child: AppBar(
//             backgroundColor: FlutterFlowTheme.of(context).alternate,
//             automaticallyImplyLeading: false,
//             leading: InkWell(
//               splashColor: Colors.transparent,
//               focusColor: Colors.transparent,
//               hoverColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               onDoubleTap: () async {},
//               child: FlutterFlowIconButton(
//                 borderColor: Colors.transparent,
//                 borderRadius: 30.0,
//                 borderWidth: 1.0,
//                 buttonSize: 60.0,
//                 icon: Icon(
//                   Icons.arrow_back_rounded,
//                   color: FlutterFlowTheme.of(context).primaryText,
//                   size: 30.0,
//                 ),
//                 onPressed: () async {
//                   context.pushNamed('HomePage');
//                 },
//               ),
//             ),
//             title: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 56.0, 0.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'HelioScan',
//                     style: FlutterFlowTheme.of(context).headlineMedium.override(
//                           fontFamily: 'Outfit',
//                           fontWeight: FontWeight.w600,
//                         ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(0.0),
//                     child: Image.asset(
//                       'assets/images/1708180515831-Standard.png',
//                       width: MediaQuery.sizeOf(context).width * 0.136,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ].divide(SizedBox(width: 5.0)),
//               ),
//             ),
//             actions: [],
//             centerTitle: false,
//             elevation: 2.0,
//           ),
//         ),
//         body: SafeArea(
//           top: true,
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               color: FlutterFlowTheme.of(context).secondaryBackground,
//             ),
//             child: Align(
//               alignment: AlignmentDirectional(0.0, 0.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     splashColor: Colors.transparent,
//                     focusColor: Colors.transparent,
//                     hoverColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     onTap: () async {
//                       await launchURL(widget.qrCodeResult);
//                     },
//                     child: Text(
//                       valueOrDefault(widget.qrCodeResult, 'test'),
//                       style: FlutterFlowTheme.of(context).bodyMedium,
//                     ),
//                   ),
//                   Text(
//                     'Welcome to ELECTION_NAME',
//                     style: FlutterFlowTheme.of(context).bodyMedium,
//                   ),
//                   Text(
//                     'What\'s next? \nif you chooses to verify your vote, ',
//                     style: FlutterFlowTheme.of(context).bodyMedium,
//                   ),
//                   Align(
//                     alignment: AlignmentDirectional(0.0, 0.0),
//                     child: FlutterFlowIconButton(
//                       borderColor:
//                           FlutterFlowTheme.of(context).primaryBackground,
//                       borderRadius: 20.0,
//                       borderWidth: 1.0,
//                       buttonSize: 113.0,
//                       fillColor: FlutterFlowTheme.of(context).alternate,
//                       icon: Icon(
//                         Icons.qr_code_scanner_outlined,
//                         color: FlutterFlowTheme.of(context).primaryText,
//                         size: 80.0,
//                       ),
//                       onPressed: () {
//                         print('IconButton pressed ...');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// Inside _WelcomePageWidgetState class

class _WelcomePageWidgetState extends State<WelcomePageWidget> {
  late WelcomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> qrCodeResultList = [];

@override
void initState() {
  super.initState();
  _model = createModel(context, () => WelcomePageModel());

  // Initialize qrCodeResultList directly from widget.qrCodeResult
  if (widget.qrCodeResult != null) {
    qrCodeResultList = widget.qrCodeResult!
        .substring(1, widget.qrCodeResult!.length - 1)
        .split(',');
  }

  WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
}



  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         appBar: PreferredSize(
//           preferredSize:
//               Size.fromHeight(MediaQuery.sizeOf(context).height * 0.08),
//           child: AppBar(
//             backgroundColor: FlutterFlowTheme.of(context).alternate,
//             automaticallyImplyLeading: false,
//             leading: InkWell(
//               splashColor: Colors.transparent,
//               focusColor: Colors.transparent,
//               hoverColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               onDoubleTap: () async {},
//               child: FlutterFlowIconButton(
//                 borderColor: Colors.transparent,
//                 borderRadius: 30.0,
//                 borderWidth: 1.0,
//                 buttonSize: 60.0,
//                 icon: Icon(
//                   Icons.arrow_back_rounded,
//                   color: FlutterFlowTheme.of(context).primaryText,
//                   size: 30.0,
//                 ),
//                 onPressed: () async {
//                   context.pushNamed('ElectionsPage');
//                 },
//               ),
//             ),
//             title: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 56.0, 0.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'HelioScan',
//                     style: FlutterFlowTheme.of(context).headlineMedium.override(
//                           fontFamily: 'Outfit',
//                           fontWeight: FontWeight.w600,
//                         ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(0.0),
//                     child: Image.asset(
//                       'assets/images/1708180515831-Standard.png',
//                       width: MediaQuery.sizeOf(context).width * 0.136,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ].divide(SizedBox(width: 5.0)),
//               ),
//             ),
//             actions: [],
//             centerTitle: false,
//             elevation: 2.0,
//           ),
//         ),
//         body: SafeArea(
//           top: true,
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               color: FlutterFlowTheme.of(context).secondaryBackground,
//             ),
//             child: Align(
//               alignment: AlignmentDirectional(0.0, 0.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     splashColor: Colors.transparent,
//                     focusColor: Colors.transparent,
//                     hoverColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     onTap: () async {
//                       await launchURL(qrCodeResultList.first); // Use first URL
//                     },
//                     child: Text(
//                       valueOrDefault<String>(qrCodeResultList[1], 'test'), // Display first element
//                       style: FlutterFlowTheme.of(context).bodyMedium,
//                     ),
//                   ),
//                   Text(
//                     qrCodeResultList.isNotEmpty
//                         ? 'Welcome to ${qrCodeResultList.first}'
//                         : 'Welcome to ELECTION_NAME',
//                     style: FlutterFlowTheme.of(context).bodyMedium,
//                   ),
//                   Text(
//                     'What\'s next? \nif you choose to verify your vote, ',
//                     style: FlutterFlowTheme.of(context).bodyMedium,
//                   ),
//                   Align(
//                     alignment: AlignmentDirectional(0.0, 0.0),
//                     child: FlutterFlowIconButton(
//                       borderColor:
//                           FlutterFlowTheme.of(context).primaryBackground,
//                       borderRadius: 20.0,
//                       borderWidth: 1.0,
//                       buttonSize: 113.0,
//                       fillColor: FlutterFlowTheme.of(context).alternate,
//                       icon: Icon(
//                         Icons.qr_code_scanner_outlined,
//                         color: FlutterFlowTheme.of(context).primaryText,
//                         size: 80.0,
//                       ),
//                       onPressed: () {
//                         print('IconButton pressed ...');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


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
        preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height * 0.08),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).alternate,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onDoubleTap: () async {},
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pushNamed('ElectionsPage');
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 56.0, 0.0),
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
          actions: [],
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder<DocumentSnapshot>(
                  future: _getBallotTrackerDocument(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    final ballotTrackerDoc = BallotRecord.fromSnapshot(snapshot.data!);
                    return InkWell(
                      onTap: () async {
                        await launchURL(ballotTrackerDoc.toString());
                      },
                      child: Text(
                        ballotTrackerDoc.purpose.toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    );
                  },
                ),
                Text(
                  widget.election != null
                      ? 'Welcome to ${widget.election!.electionName}'
                      : 'Welcome to ${qrCodeResultList.first}',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  'What\'s next? \nif you choose to verify your vote, ',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 113.0,
                    fillColor: FlutterFlowTheme.of(context).alternate,
                    icon: Icon(
                      Icons.qr_code_scanner_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 80.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Future<DocumentSnapshot> _getBallotTrackerDocument() async {
  if (widget.election != null) {
    final ballotTracker = widget.election!.ballotTracker;
    if (ballotTracker != null) {
      return await ballotTracker.get();
    }
  } else {
    // Fetch the document reference using the ID
    final String ballotTrackerID = qrCodeResultList.first;
    final DocumentReference ballotTrackerRef = BallotRecord.collection.doc(ballotTrackerID);
    return await ballotTrackerRef.get();
  }
  // Return a default value or handle the case when ballotTracker is null
  return Future.error('Ballot tracker not found');
}



}