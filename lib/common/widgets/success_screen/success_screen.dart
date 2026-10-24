import 'dart:io';

import 'package:e_commerce/common/style/spacing_styles.dart';
import 'package:e_commerce/data/services/MailUtil.dart';
import 'package:e_commerce/data/services/WhatsAppUtil.dart';
import 'package:e_commerce/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../../../utils/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subtitle;
  final VoidCallback onPress;
  final OrderModel? order;



  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPress,
    this.order,
  });

  @override
  Widget build(BuildContext context) {

    final String htmlTemplate = createMailTemplate(order!);

    final smtpServer = gmail(
      dotenv.env["GMAIL_MAIL"]!,
      dotenv.env["GMAIL_PASSWORD"]!,
    );

    sendMailFromGmail(String sender, sub, text) async {
      // 2. Create the message
      final message = Message()
        ..from = Address(dotenv.env["GMAIL_MAIL"]!, 'La_Copia_China')
        ..recipients.add(sender) // Add recipient email
        ..subject = sub
        ..html = text; 

      try {
        final sendReport = await send(message, smtpServer);
        print('Message sent: ' + sendReport.toString());
      } on MailerException catch (e) {
        print('Message not sent.');
        for (var p in e.problems) {
          print('Problem: ${p.code}: ${p.msg}');
        }
      }
    }

    String message = "Hola, hice esta orden: ${order.toString()}";
    String phoneNumber = "+56964117545";
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight * 1,
          child: Column(
            children: [
              /// Image
              Image(
                image: AssetImage(image),
                width: HelperFunctions.screenWidth() * 0.5,
              ),
              const SizedBox(height: USizes.spaceBtwSections),

              /// Title % Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: USizes.spaceBtwItems),

              if (order!.id.isNotEmpty)
                Text(
                  order!.id,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              if (order!.id.isNotEmpty)
                const SizedBox(height: USizes.spaceBtwItems),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: USizes.spaceBtwSections),

              // [WHATSAPP]
              SizedBox(
                width: 160,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green, // Sets the background (fill) color
                    // foregroundColor: Colors.white, // Sets the text and icon color
                    side: const BorderSide(
                      color: Colors.white, // Sets the border color
                      width: 2.0, // Sets the border width
                    ),
                    // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                  ),
                  onPressed: () => WhatApputil.openWhatsApp(
                    phoneNumber: phoneNumber,
                    message: message,
                  ),
                  child: const Text('Enviar Whatsapp'),
                ),
              ),
              const SizedBox(height: USizes.spaceBtwSections / 2),

              // [GMAIL]
              SizedBox(
                width: 160,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.red, // Sets the background (fill) color
                    // foregroundColor: Colors.white, // Sets the text and icon color
                    side: const BorderSide(
                      color: Colors.white, // Sets the border color
                      width: 2.0, // Sets the border width
                    ),
                    // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                  ),
                  onPressed: () =>
                      //Mailutil.sendEmail(),
                      sendMailFromGmail(
                        'makerjoshe@gmail.com',
                        'Boleta enviada desde App La CopiaChina;',
                        htmlTemplate,
                      ),
                  child: const Text('Enviar Mail'),
                ),
              ),
              const SizedBox(height: USizes.spaceBtwSections / 2),

              /// Buttons
              SizedBox(
                width: 160,
                height: 60,
                child: ElevatedButton(
                  onPressed: onPress,
                  child: const Text('Ir a Menu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String createMailTemplate(OrderModel order) {
    String htmlTemplate =
        '''
    <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Orden CopiaChina</title>
          <style>

              :root {
                  --primary: #2563eb;
                  --text-main: #1f2937;
                  --text-muted: #4b5563;
                  --bg-light: #f9fafb;
                  --border: #e5e7eb;
              }

              body {
                  margin: 0;
                  padding: 0;
                  position: relative;
                  min-height: 100vh;
                  z-index: 0;
                  
                  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
                  line-height: 1.5;
                  color: var(--text-main);
                  background-color: #f3f4f6;
                  margin: 0;
                  padding: 40px 20px;
              }

              .container {
                  max-width: 650px;
                  margin: 0 auto;
                  background: #ffffff;
                  border-radius: 8px;
                  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                  padding: 32px;
              }

              .header {
                  position: inherit;
                  z-index: 0;
                  text-align: center;
                  border-bottom: 2px solid var(--border);
                  padding-bottom: 24px;
                  margin-bottom: 24px;
              }

              .success-icon {
                  font-size: 48px;
                  color: #10b981;
                  margin-bottom: 8px;
              }

              h1 {
                  font-size: 24px;
                  margin: 0 0 8px 0;
                  color: var(--text-main);
              }

              .order-number {
                  font-size: 14px;
                  color: var(--text-muted);
                  font-weight: 500;
              }

              .grid {
                  position: relative;
                  z-index: 5;
                  display: grid;
                  grid-template-columns: 1fr 1fr;
                  gap: 24px;
                  margin-bottom: 32px;
              }

              @media (max-width: 480px) {
                  .grid {
                      grid-template-columns: 1fr;
                  }
              }

              h2 {
                  font-size: 16px;
                  text-transform: uppercase;
                  letter-spacing: 0.05em;
                  color: var(--text-muted);
                  margin: 0 0 12px 0;
                  border-bottom: 1px solid var(--border);
                  padding-bottom: 6px;
              }

              p {
                  margin: 0 0 4px 0;
                  font-size: 15px;
              }

              .summary-table {
                  width: 100%;
                  border-collapse: collapse;
                  margin-bottom: 32px;
              }

              .summary-table th, 
              .summary-table td {
                  padding: 12px;
                  text-align: left;
                  border-bottom: 1px solid var(--border);
                  font-size: 15px;
              }

              .summary-table th {
                  color: var(--text-muted);
                  font-weight: 600;
                  background-color: var(--bg-light);
              }

              .text-right {
                  text-align: right !important;
              }

              .totals {
                  width: 50%;
                  margin-left: auto;
                  margin-bottom: 32px;
              }

              @media (max-width: 480px) {
                  .totals {
                      width: 100%;
                  }
              }

              .total-row {
                  display: flex;
                  justify-content: space-between;
                  padding: 6px 0;
                  font-size: 15px;
              }

              .total-row.final {
                  border-top: 2px solid var(--border);
                  font-weight: 700;
                  font-size: 18px;
                  padding-top: 12px;
                  margin-top: 6px;
              }

              .footer {
                  text-align: center;
                  font-size: 14px;
                  color: var(--text-muted);
                  border-top: 1px solid var(--border);
                  padding-top: 24px;
              }

              .btn {
                  display: inline-block;
                  background-color: var(--primary);
                  color: #ffffff;
                  text-decoration: none;
                  padding: 12px 24px;
                  border-radius: 6px;
                  font-weight: 500;
                  margin-top: 16px;
              }
              .wrapper{
                  position: absolute;
                  top: 60px;    /* Distance from the top */
                  left: 10px;  /* Distance from the right */
                  width: 200px; /* Adjust size as needed */
                  height: auto;
                  z-index: 0;
              }

              .flex-container {
                display: flex; /* Activates flexbox layout */
                flex-direction: row; /* Default: lays items out left-to-right */
                  /*justify-content: space-between;*/
                  /*align-items: center; /* Vertically aligns items in the middle */
                gap: 60px; /* Creates spacing between the items */
              }

              .flex-item {
                background-color: #f1f1f1;
                padding: 20px;
                border-radius: 60px;
              }
          </style>
      </head>
      <body>
          <div class="container">
              <div class="header">
                  <div class="flex-container">
                      <div class="left">
                          <img src="https://drive.google.com/uc?export=view&id=1K5f_2pb-KS_ipN7-vOCMlhGXFoBr7qbc" alt="Description" loading="lazy" width="180" >
                      </div>
                      <div class="righ">
                          <div class="success-icon">✓</div>
                          <h1>Orden Creada Exitosamente!</h1>
                          <div class="order-number">Orden ID: ${order.id}</div>
                      </div>
                  </div>        
              </div>
              <div class="grid">
                  <div>
                      <h2>Direccion de Envio</h2>
                      <p><strong>${order.address?.name}</strong></p>
                      <p>${order.address?.street}</p>
                      <p>${order.address?.city}</p>
                      <p>${order.address?.state}, ${order.address?.country}</p>
                  </div>
                  <div>
                      <h2>Detalle Orden</h2>
                      <p><strong>Fecha:</strong> ${order.orderDate}</p>
                      <p><strong>Status:</strong> ${order.status}</p>
                      <p><strong>Tipo de Despacho:</strong> ${order.orderStatusText}</p>
                  </div>
              </div>

              <h2>Productos</h2>
              <table class="summary-table">
                  <thead>
                      <tr>
                          <th>Descripcion</th>
                          <th class="text-right">Cantidad</th>
                          <th class="text-right">Precio</th>
                      </tr>
                  </thead>
                  <tbody>
      ''';

    order.items.forEach((item) {
      htmlTemplate +=
          '''
            <tr>
                <td>${item.title}</td>
                <td class="text-right">${item.quantity}</td>
                <td class="text-right">${item.price}</td>
            </tr>
        ''';
    });

    htmlTemplate +=
        '''
                  </tbody>
              </table>

              <div class="totals">
                  <div class="total-row">
                      <span>Subtotal:</span>
                      <span style="padding-right: 12px;">${order.totalAmount-5000}</span>
                  </div>
                  <div class="total-row">
                      <span>Envio:</span>
                      <span style="padding-right: 12px;">5000</span>
                  </div>
                  <div class="total-row final">
                      <span>Total a Pagar:</span>
                      <span style="padding-right: 12px;">${order.totalAmount}</span>
                  </div>
              </div>

              <div class="footer">
                  <p>Tus productos seran enviados una vez Confirmemos tu Pago.</p>
                  <p>Puedes revisar el estado de tu Orden en la App de CopiaChina, Configuracion/Ordenes</p>
              </div>
          </div>

      </body>
      </html>
      ''';

    print(htmlTemplate);
    return htmlTemplate;
  }
}

 final chileanPesoFormat = NumberFormat.currency(
    locale: 'es_CL',
    symbol: ' ', // or 'CLP\$'
    decimalDigits: 0, // CLP typically doesn't use cents
  );