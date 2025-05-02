import 'package:flutter/material.dart';
// how do I ignore all of my linters for this file?

class DecoTradeHubSplashLogo extends StatelessWidget {
  const DecoTradeHubSplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 300),
      painter: RPSCustomPainter(),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.4051250, size.height * 0.4011250)
      ..cubicTo(
        size.width * 0.4051250,
        size.height * 0.3517396,
        size.width * 0.4451458,
        size.height * 0.3117188,
        size.width * 0.4945208,
        size.height * 0.3117188,
      )
      ..cubicTo(
        size.width * 0.5438958,
        size.height * 0.3117188,
        size.width * 0.5839271,
        size.height * 0.3517396,
        size.width * 0.5839271,
        size.height * 0.4011250,
      )
      ..cubicTo(
        size.width * 0.5839271,
        size.height * 0.4074167,
        size.width * 0.5832708,
        size.height * 0.4135521,
        size.width * 0.5820313,
        size.height * 0.4194792,
      )
      ..cubicTo(
        size.width * 0.5852187,
        size.height * 0.4101250,
        size.width * 0.5869479,
        size.height * 0.4001042,
        size.width * 0.5869479,
        size.height * 0.3896667,
      )
      ..cubicTo(
        size.width * 0.5869479,
        size.height * 0.3386250,
        size.width * 0.5455729,
        size.height * 0.2972396,
        size.width * 0.4945208,
        size.height * 0.2972396,
      )
      ..cubicTo(
        size.width * 0.4434792,
        size.height * 0.2972396,
        size.width * 0.4020937,
        size.height * 0.3386250,
        size.width * 0.4020937,
        size.height * 0.3896667,
      )
      ..cubicTo(
        size.width * 0.4020937,
        size.height * 0.4001042,
        size.width * 0.4038229,
        size.height * 0.4101250,
        size.width * 0.4070104,
        size.height * 0.4194792,
      )
      ..cubicTo(
        size.width * 0.4057708,
        size.height * 0.4135521,
        size.width * 0.4051250,
        size.height * 0.4074167,
        size.width * 0.4051250,
        size.height * 0.4011250,
      );

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffdfaa3f);
    canvas.drawPath(path_0, paint0Fill);

    final path_1 = Path()
      ..moveTo(size.width * 0.4921563, size.height * 0.4413125)
      ..lineTo(size.width * 0.4740833, size.height * 0.4413125)
      ..lineTo(size.width * 0.4740833, size.height * 0.4232396)
      ..lineTo(size.width * 0.4921563, size.height * 0.4232396)
      ..lineTo(size.width * 0.4921563, size.height * 0.4413125);

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff595959);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5149583, size.height * 0.4413125);
    path_2.lineTo(size.width * 0.4968854, size.height * 0.4413125);
    path_2.lineTo(size.width * 0.4968854, size.height * 0.4232396);
    path_2.lineTo(size.width * 0.5149583, size.height * 0.4232396);
    path_2.lineTo(size.width * 0.5149583, size.height * 0.4413125);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff595959).withOpacity(1);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.4921563, size.height * 0.4635417);
    path_3.lineTo(size.width * 0.4740833, size.height * 0.4635417);
    path_3.lineTo(size.width * 0.4740833, size.height * 0.4454688);
    path_3.lineTo(size.width * 0.4921563, size.height * 0.4454688);
    path_3.lineTo(size.width * 0.4921563, size.height * 0.4635417);

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xff595959).withOpacity(1);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.5149583, size.height * 0.4635417);
    path_4.lineTo(size.width * 0.4968854, size.height * 0.4635417);
    path_4.lineTo(size.width * 0.4968854, size.height * 0.4454688);
    path_4.lineTo(size.width * 0.5149583, size.height * 0.4454688);
    path_4.lineTo(size.width * 0.5149583, size.height * 0.4635417);

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xff595959).withOpacity(1);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.4945208, size.height * 0.3761146);
    path_5.lineTo(size.width * 0.6017604, size.height * 0.4833438);
    path_5.lineTo(size.width * 0.6292708, size.height * 0.4833438);
    path_5.lineTo(size.width * 0.4945208, size.height * 0.3486042);
    path_5.lineTo(size.width * 0.3597708, size.height * 0.4833438);
    path_5.lineTo(size.width * 0.3872917, size.height * 0.4833438);
    path_5.lineTo(size.width * 0.4945208, size.height * 0.3761146);

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xff595959).withOpacity(1);
    canvas.drawPath(path_5, paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.4945208, size.height * 0.3823438);
    path_6.lineTo(size.width * 0.4372292, size.height * 0.4406354);
    path_6.lineTo(size.width * 0.4945208, size.height * 0.3902292);
    path_6.lineTo(size.width * 0.5518229, size.height * 0.4406354);
    path_6.lineTo(size.width * 0.4945208, size.height * 0.3823438);

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Color(0xffd8d8d8).withOpacity(1);
    canvas.drawPath(path_6, paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.6703333, size.height * 0.4980833);
    path_7.cubicTo(
        size.width * 0.6703333,
        size.height * 0.4980833,
        size.width * 0.6695521,
        size.height * 0.4990938,
        size.width * 0.6680937,
        size.height * 0.5010208);
    path_7.cubicTo(
        size.width * 0.6666354,
        size.height * 0.5029688,
        size.width * 0.6643437,
        size.height * 0.5056979,
        size.width * 0.6611875,
        size.height * 0.5091250);
    path_7.cubicTo(
        size.width * 0.6595729,
        size.height * 0.5107708,
        size.width * 0.6578229,
        size.height * 0.5126875,
        size.width * 0.6556979,
        size.height * 0.5145729);
    path_7.cubicTo(
        size.width * 0.6546458,
        size.height * 0.5155208,
        size.width * 0.6535937,
        size.height * 0.5165833,
        size.width * 0.6523854,
        size.height * 0.5175521);
    path_7.cubicTo(
        size.width * 0.6511875,
        size.height * 0.5185417,
        size.width * 0.6499479,
        size.height * 0.5195625,
        size.width * 0.6486667,
        size.height * 0.5206250);
    path_7.cubicTo(
        size.width * 0.6433958,
        size.height * 0.5247292,
        size.width * 0.6370000,
        size.height * 0.5289896,
        size.width * 0.6293750,
        size.height * 0.5328333);
    path_7.cubicTo(
        size.width * 0.6161875,
        size.height * 0.5396042,
        size.width * 0.5991771,
        size.height * 0.5445417,
        size.width * 0.5802187,
        size.height * 0.5465208);
    path_7.lineTo(size.width * 0.5629271, size.height * 0.5475000);
    path_7.cubicTo(
        size.width * 0.5616667,
        size.height * 0.5475313,
        size.width * 0.5604063,
        size.height * 0.5475417,
        size.width * 0.5591354,
        size.height * 0.5475417);
    path_7.cubicTo(
        size.width * 0.5402500,
        size.height * 0.5475417,
        size.width * 0.5202708,
        size.height * 0.5452500,
        size.width * 0.5000833,
        size.height * 0.5417917);
    path_7.cubicTo(
        size.width * 0.4753333,
        size.height * 0.5375833,
        size.width * 0.4524167,
        size.height * 0.5323125,
        size.width * 0.4316250,
        size.height * 0.5289271);
    path_7.cubicTo(
        size.width * 0.4307187,
        size.height * 0.5287708,
        size.width * 0.4298021,
        size.height * 0.5286354,
        size.width * 0.4289167,
        size.height * 0.5284896);
    path_7.cubicTo(
        size.width * 0.4229583,
        size.height * 0.5275313,
        size.width * 0.4171771,
        size.height * 0.5267500,
        size.width * 0.4116146,
        size.height * 0.5261771);
    path_7.cubicTo(
        size.width * 0.4083958,
        size.height * 0.5258438,
        size.width * 0.4052500,
        size.height * 0.5255729,
        size.width * 0.4021563,
        size.height * 0.5253646);
    path_7.cubicTo(
        size.width * 0.3982813,
        size.height * 0.5251458,
        size.width * 0.3945000,
        size.height * 0.5250313,
        size.width * 0.3908750,
        size.height * 0.5250313);
    path_7.cubicTo(
        size.width * 0.3858646,
        size.height * 0.5250313,
        size.width * 0.3811042,
        size.height * 0.5252604,
        size.width * 0.3766354,
        size.height * 0.5257813);
    path_7.cubicTo(
        size.width * 0.3688958,
        size.height * 0.5266458,
        size.width * 0.3619583,
        size.height * 0.5282188,
        size.width * 0.3560521,
        size.height * 0.5302292);
    path_7.cubicTo(
        size.width * 0.3501250,
        size.height * 0.5322292,
        size.width * 0.3452187,
        size.height * 0.5346458,
        size.width * 0.3413125,
        size.height * 0.5368542);
    path_7.cubicTo(
        size.width * 0.3393854,
        size.height * 0.5380000,
        size.width * 0.3376354,
        size.height * 0.5390104,
        size.width * 0.3362292,
        size.height * 0.5400208);
    path_7.cubicTo(
        size.width * 0.3347917,
        size.height * 0.5409792,
        size.width * 0.3335521,
        size.height * 0.5417917,
        size.width * 0.3325937,
        size.height * 0.5425625);
    path_7.cubicTo(
        size.width * 0.3306667,
        size.height * 0.5440104,
        size.width * 0.3296563,
        size.height * 0.5447813,
        size.width * 0.3296563,
        size.height * 0.5447813);
    path_7.cubicTo(
        size.width * 0.3296563,
        size.height * 0.5447813,
        size.width * 0.3304583,
        size.height * 0.5437917,
        size.width * 0.3319792,
        size.height * 0.5419271);
    path_7.cubicTo(
        size.width * 0.3327187,
        size.height * 0.5409688,
        size.width * 0.3337396,
        size.height * 0.5398750,
        size.width * 0.3349687,
        size.height * 0.5385625);
    path_7.cubicTo(
        size.width * 0.3361771,
        size.height * 0.5372188,
        size.width * 0.3376875,
        size.height * 0.5358125,
        size.width * 0.3394063,
        size.height * 0.5342292);
    path_7.cubicTo(
        size.width * 0.3428958,
        size.height * 0.5311354,
        size.width * 0.3474583,
        size.height * 0.5275521,
        size.width * 0.3533542,
        size.height * 0.5242500);
    path_7.cubicTo(
        size.width * 0.3592187,
        size.height * 0.5209167,
        size.width * 0.3663854,
        size.height * 0.5178750,
        size.width * 0.3746354,
        size.height * 0.5155938);
    path_7.cubicTo(
        size.width * 0.3828854,
        size.height * 0.5132604,
        size.width * 0.3921771,
        size.height * 0.5118750,
        size.width * 0.4021146,
        size.height * 0.5111771);
    path_7.cubicTo(
        size.width * 0.4052187,
        size.height * 0.5109792,
        size.width * 0.4083958,
        size.height * 0.5108646,
        size.width * 0.4116146,
        size.height * 0.5108229);
    path_7.cubicTo(
        size.width * 0.4126771,
        size.height * 0.5108125,
        size.width * 0.4137292,
        size.height * 0.5107917,
        size.width * 0.4147917,
        size.height * 0.5107917);
    path_7.cubicTo(
        size.width * 0.4194063,
        size.height * 0.5107917,
        size.width * 0.4241146,
        size.height * 0.5109375,
        size.width * 0.4289167,
        size.height * 0.5112083);
    path_7.cubicTo(
        size.width * 0.4305000,
        size.height * 0.5113021,
        size.width * 0.4320625,
        size.height * 0.5114063,
        size.width * 0.4336563,
        size.height * 0.5115208);
    path_7.cubicTo(
        size.width * 0.4556979,
        size.height * 0.5131042,
        size.width * 0.4792813,
        size.height * 0.5171875,
        size.width * 0.5035417,
        size.height * 0.5213229);
    path_7.cubicTo(
        size.width * 0.5245833,
        size.height * 0.5249167,
        size.width * 0.5445104,
        size.height * 0.5280625,
        size.width * 0.5629271,
        size.height * 0.5292500);
    path_7.cubicTo(
        size.width * 0.5657708,
        size.height * 0.5294479,
        size.width * 0.5685833,
        size.height * 0.5295833,
        size.width * 0.5713542,
        size.height * 0.5296667);
    path_7.cubicTo(
        size.width * 0.5738542,
        size.height * 0.5297604,
        size.width * 0.5763333,
        size.height * 0.5298021,
        size.width * 0.5787813,
        size.height * 0.5298021);
    path_7.cubicTo(
        size.width * 0.5792604,
        size.height * 0.5298021,
        size.width * 0.5797396,
        size.height * 0.5298021,
        size.width * 0.5802187,
        size.height * 0.5297813);
    path_7.cubicTo(
        size.width * 0.5973333,
        size.height * 0.5296667,
        size.width * 0.6127083,
        size.height * 0.5273438,
        size.width * 0.6254479,
        size.height * 0.5232188);
    path_7.cubicTo(
        size.width * 0.6329063,
        size.height * 0.5208646,
        size.width * 0.6394687,
        size.height * 0.5179896,
        size.width * 0.6450937,
        size.height * 0.5151146);
    path_7.cubicTo(
        size.width * 0.6506875,
        size.height * 0.5121667,
        size.width * 0.6553437,
        size.height * 0.5092292,
        size.width * 0.6590833,
        size.height * 0.5066563);
    path_7.cubicTo(
        size.width * 0.6627708,
        size.height * 0.5040625,
        size.width * 0.6656146,
        size.height * 0.5019271,
        size.width * 0.6674583,
        size.height * 0.5003958);
    path_7.cubicTo(
        size.width * 0.6693333,
        size.height * 0.4988750,
        size.width * 0.6703333,
        size.height * 0.4980833,
        size.width * 0.6703333,
        size.height * 0.4980833);

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Color(0xffdfaa3f).withOpacity(1);
    canvas.drawPath(path_7, paint_7_fill);

    Path path_8 = Path();
    path_8.moveTo(size.width * 0.5629271, size.height * 0.5475000);
    path_8.cubicTo(
        size.width * 0.5658542,
        size.height * 0.5474688,
        size.width * 0.5687292,
        size.height * 0.5473542,
        size.width * 0.5715937,
        size.height * 0.5471875);
    path_8.cubicTo(
        size.width * 0.5745208,
        size.height * 0.5470313,
        size.width * 0.5773750,
        size.height * 0.5468125,
        size.width * 0.5802187,
        size.height * 0.5465208);
    path_8.lineTo(size.width * 0.5629271, size.height * 0.5475000);

    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = Color(0xffdfaa3f).withOpacity(1);
    canvas.drawPath(path_8, paint_8_fill);

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.3447917, size.height * 0.5439479);
    path_9.cubicTo(
        size.width * 0.3447917,
        size.height * 0.5439479,
        size.width * 0.3456875,
        size.height * 0.5433229,
        size.width * 0.3473958,
        size.height * 0.5421563);
    path_9.cubicTo(
        size.width * 0.3482396,
        size.height * 0.5415625,
        size.width * 0.3493750,
        size.height * 0.5409479,
        size.width * 0.3506875,
        size.height * 0.5401563);
    path_9.cubicTo(
        size.width * 0.3513542,
        size.height * 0.5397604,
        size.width * 0.3520937,
        size.height * 0.5394167,
        size.width * 0.3528750,
        size.height * 0.5390104);
    path_9.cubicTo(
        size.width * 0.3536563,
        size.height * 0.5386042,
        size.width * 0.3544896,
        size.height * 0.5381771,
        size.width * 0.3554063,
        size.height * 0.5378021);
    path_9.cubicTo(
        size.width * 0.3590417,
        size.height * 0.5361563,
        size.width * 0.3636875,
        size.height * 0.5345313,
        size.width * 0.3692813,
        size.height * 0.5333958);
    path_9.cubicTo(
        size.width * 0.3748542,
        size.height * 0.5322500,
        size.width * 0.3813542,
        size.height * 0.5315625,
        size.width * 0.3885208,
        size.height * 0.5315625);
    path_9.cubicTo(
        size.width * 0.4028854,
        size.height * 0.5315104,
        size.width * 0.4197604,
        size.height * 0.5341771,
        size.width * 0.4379687,
        size.height * 0.5382188);
    path_9.cubicTo(
        size.width * 0.4562083,
        size.height * 0.5422396,
        size.width * 0.4758750,
        size.height * 0.5475625,
        size.width * 0.4965729,
        size.height * 0.5520625);
    path_9.cubicTo(
        size.width * 0.5172604,
        size.height * 0.5565938,
        size.width * 0.5371042,
        size.height * 0.5596042,
        size.width * 0.5552604,
        size.height * 0.5599896);
    path_9.cubicTo(
        size.width * 0.5643333,
        size.height * 0.5601667,
        size.width * 0.5729479,
        size.height * 0.5597604,
        size.width * 0.5809687,
        size.height * 0.5588229);
    path_9.cubicTo(
        size.width * 0.5889792,
        size.height * 0.5578646,
        size.width * 0.5963854,
        size.height * 0.5563646,
        size.width * 0.6030521,
        size.height * 0.5545938);
    path_9.cubicTo(
        size.width * 0.6097292,
        size.height * 0.5528333,
        size.width * 0.6156563,
        size.height * 0.5507708,
        size.width * 0.6207708,
        size.height * 0.5486979);
    path_9.cubicTo(
        size.width * 0.6233542,
        size.height * 0.5477188,
        size.width * 0.6256771,
        size.height * 0.5466042,
        size.width * 0.6278646,
        size.height * 0.5456771);
    path_9.cubicTo(
        size.width * 0.6300000,
        size.height * 0.5446458,
        size.width * 0.6319583,
        size.height * 0.5436979,
        size.width * 0.6337187,
        size.height * 0.5428542);
    path_9.cubicTo(
        size.width * 0.6354479,
        size.height * 0.5419479,
        size.width * 0.6369896,
        size.height * 0.5411354,
        size.width * 0.6383229,
        size.height * 0.5404271);
    path_9.cubicTo(
        size.width * 0.6396563,
        size.height * 0.5397292,
        size.width * 0.6407500,
        size.height * 0.5390625,
        size.width * 0.6416458,
        size.height * 0.5385521);
    path_9.cubicTo(
        size.width * 0.6434479,
        size.height * 0.5375313,
        size.width * 0.6443958,
        size.height * 0.5369896,
        size.width * 0.6443958,
        size.height * 0.5369896);
    path_9.cubicTo(
        size.width * 0.6443958,
        size.height * 0.5369896,
        size.width * 0.6435313,
        size.height * 0.5376563,
        size.width * 0.6418958,
        size.height * 0.5389271);
    path_9.cubicTo(
        size.width * 0.6410625,
        size.height * 0.5395521,
        size.width * 0.6400729,
        size.height * 0.5403646,
        size.width * 0.6388333,
        size.height * 0.5412396);
    path_9.cubicTo(
        size.width * 0.6375833,
        size.height * 0.5421146,
        size.width * 0.6361563,
        size.height * 0.5431250,
        size.width * 0.6345417,
        size.height * 0.5442604);
    path_9.cubicTo(
        size.width * 0.6328750,
        size.height * 0.5453229,
        size.width * 0.6310417,
        size.height * 0.5465313,
        size.width * 0.6289896,
        size.height * 0.5477917);
    path_9.cubicTo(
        size.width * 0.6268958,
        size.height * 0.5490000,
        size.width * 0.6246667,
        size.height * 0.5503958,
        size.width * 0.6221563,
        size.height * 0.5516667);
    path_9.cubicTo(
        size.width * 0.6171875,
        size.height * 0.5543542,
        size.width * 0.6113333,
        size.height * 0.5570833,
        size.width * 0.6046250,
        size.height * 0.5595417);
    path_9.cubicTo(
        size.width * 0.5979167,
        size.height * 0.5620104,
        size.width * 0.5903542,
        size.height * 0.5642188,
        size.width * 0.5820729,
        size.height * 0.5658333);
    path_9.cubicTo(
        size.width * 0.5737813,
        size.height * 0.5674271,
        size.width * 0.5647917,
        size.height * 0.5684479,
        size.width * 0.5553021,
        size.height * 0.5687500);
    path_9.cubicTo(
        size.width * 0.5363125,
        size.height * 0.5693438,
        size.width * 0.5155000,
        size.height * 0.5668333,
        size.width * 0.4943646,
        size.height * 0.5622083);
    path_9.cubicTo(
        size.width * 0.4732083,
        size.height * 0.5576042,
        size.width * 0.4536458,
        size.height * 0.5516250,
        size.width * 0.4358646,
        size.height * 0.5467292);
    path_9.cubicTo(
        size.width * 0.4180937,
        size.height * 0.5417917,
        size.width * 0.4020208,
        size.height * 0.5379688,
        size.width * 0.3882917,
        size.height * 0.5367500);
    path_9.cubicTo(
        size.width * 0.3814479,
        size.height * 0.5361146,
        size.width * 0.3752083,
        size.height * 0.5361354,
        size.width * 0.3697708,
        size.height * 0.5366458);
    path_9.cubicTo(
        size.width * 0.3643229,
        size.height * 0.5371458,
        size.width * 0.3596875,
        size.height * 0.5381667,
        size.width * 0.3559896,
        size.height * 0.5393125);
    path_9.cubicTo(
        size.width * 0.3550417,
        size.height * 0.5395729,
        size.width * 0.3541875,
        size.height * 0.5398750,
        size.width * 0.3533750,
        size.height * 0.5401771);
    path_9.cubicTo(
        size.width * 0.3525625,
        size.height * 0.5404792,
        size.width * 0.3517917,
        size.height * 0.5407292,
        size.width * 0.3511042,
        size.height * 0.5410208);
    path_9.cubicTo(
        size.width * 0.3497396,
        size.height * 0.5416146,
        size.width * 0.3485417,
        size.height * 0.5420729,
        size.width * 0.3476146,
        size.height * 0.5425417);
    path_9.cubicTo(
        size.width * 0.3457708,
        size.height * 0.5434583,
        size.width * 0.3447917,
        size.height * 0.5439479,
        size.width * 0.3447917,
        size.height * 0.5439479);

    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = Color(0xffdfaa3f).withOpacity(1);
    canvas.drawPath(path_9, paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width * 0.5798542, size.height * 0.3998021);
    path_10.cubicTo(
        size.width * 0.5798542,
        size.height * 0.3526771,
        size.width * 0.5416458,
        size.height * 0.3144792,
        size.width * 0.4945208,
        size.height * 0.3144792);
    path_10.cubicTo(
        size.width * 0.4473958,
        size.height * 0.3144792,
        size.width * 0.4091979,
        size.height * 0.3526771,
        size.width * 0.4091979,
        size.height * 0.3998021);
    path_10.cubicTo(
        size.width * 0.4091979,
        size.height * 0.4006250,
        size.width * 0.4092396,
        size.height * 0.4014375,
        size.width * 0.4092604,
        size.height * 0.4022500);
    path_10.cubicTo(
        size.width * 0.4105937,
        size.height * 0.3562917,
        size.width * 0.4482396,
        size.height * 0.3194271,
        size.width * 0.4945208,
        size.height * 0.3194271);
    path_10.cubicTo(
        size.width * 0.5408125,
        size.height * 0.3194271,
        size.width * 0.5784583,
        size.height * 0.3562917,
        size.width * 0.5797917,
        size.height * 0.4022500);
    path_10.cubicTo(
        size.width * 0.5798125,
        size.height * 0.4014375,
        size.width * 0.5798542,
        size.height * 0.4006250,
        size.width * 0.5798542,
        size.height * 0.3998021);

    Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
    paint_10_fill.color = Color(0xffd8d8d8);
    canvas.drawPath(path_10, paint_10_fill);

    Path path_11 = Path();
    path_11.moveTo(size.width * 0.003041667, size.height * -0.04179167);
    path_11.lineTo(size.width * 0.01516667, size.height * -0.04179167);
    path_11.cubicTo(
        size.width * 0.02096875,
        size.height * -0.04179167,
        size.width * 0.02592708,
        size.height * -0.03980208,
        size.width * 0.03004167,
        size.height * -0.03583333);
    path_11.cubicTo(
        size.width * 0.03414583,
        size.height * -0.03185417,
        size.width * 0.03620833,
        size.height * -0.02688542,
        size.width * 0.03620833,
        size.height * -0.02091667);
    path_11.cubicTo(
        size.width * 0.03620833,
        size.height * -0.01491667,
        size.width * 0.03414583,
        size.height * -0.009927083,
        size.width * 0.03004167,
        size.height * -0.005958333);
    path_11.cubicTo(size.width * 0.02595833, size.height * -0.001979168,
        size.width * 0.02100000, 0, size.width * 0.01516667, 0);
    path_11.lineTo(size.width * 0.003041667, 0);
    path_11.close();
    path_11.moveTo(size.width * 0.01258333, size.height * -0.008500000);
    path_11.lineTo(size.width * 0.01404167, size.height * -0.008500000);
    path_11.cubicTo(
        size.width * 0.01751042,
        size.height * -0.008500000,
        size.width * 0.02034375,
        size.height * -0.009666667,
        size.width * 0.02254167,
        size.height * -0.01200000);
    path_11.cubicTo(
        size.width * 0.02476042,
        size.height * -0.01435417,
        size.width * 0.02589583,
        size.height * -0.01731250,
        size.width * 0.02595833,
        size.height * -0.02087500);
    path_11.cubicTo(
        size.width * 0.02595833,
        size.height * -0.02442708,
        size.width * 0.02484375,
        size.height * -0.02738542,
        size.width * 0.02262500,
        size.height * -0.02975000);
    path_11.cubicTo(
        size.width * 0.02039583,
        size.height * -0.03210417,
        size.width * 0.01754167,
        size.height * -0.03329167,
        size.width * 0.01404167,
        size.height * -0.03329167);
    path_11.lineTo(size.width * 0.01258333, size.height * -0.03329167);
    path_11.close();
    path_11.moveTo(size.width * 0.01258333, size.height * -0.008500000);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
