import Foundation

func sendEmail(subject: String, body: String, sendTime: Date) {
    guard let url = URL(string: "http://127.0.0.1:5000/schedule_email") else {
        print("URL inválida")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    // Formatear la fecha y hora en el formato requerido
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let sendTimeString = formatter.string(from: sendTime)

    let parameters: [String: Any] = [
        "subject": subject,
        "body": body,
        "send_time": sendTimeString
    ]

    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
    } catch {
        print("Error al serializar los datos: \(error.localizedDescription)")
        return
    }

    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    // Si utilizas una API Key, agrégala aquí
    request.addValue("daniel2589", forHTTPHeaderField: "X-API-Key")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error al enviar correo: \(error.localizedDescription)")
            return
        }

        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 200 {
                print("Correo programado exitosamente")
            } else {
                print("Error en el servidor: Código \(httpResponse.statusCode)")
                if let data = data, let serverResponse = String(data: data, encoding: .utf8) {
                    print("Respuesta del servidor: \(serverResponse)")
                }
            }
        }
    }
    task.resume()
}
