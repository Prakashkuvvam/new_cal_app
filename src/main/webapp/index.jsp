<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.Calculator" %>
<html>
<head>
    <title>Interactive Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="number"], select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #45a049;
        }
        .result {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 4px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Calculator</h1>
        
        <form method="post">
            <div class="form-group">
                <label for="num1">First Number:</label>
                <input type="number" id="num1" name="num1" required step="any" 
                       value="${param.num1 != null ? param.num1 : ''}">
            </div>
            
            <div class="form-group">
                <label for="operation">Operation:</label>
                <select id="operation" name="operation" required>
                    <option value="add" ${param.operation == 'add' ? 'selected' : ''}>Addition (+)</option>
                    <option value="subtract" ${param.operation == 'subtract' ? 'selected' : ''}>Subtraction (-)</option>
                    <option value="multiply" ${param.operation == 'multiply' ? 'selected' : ''}>Multiplication (*)</option>
                    <option value="divide" ${param.operation == 'divide' ? 'selected' : ''}>Division (/)</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="num2">Second Number:</label>
                <input type="number" id="num2" name="num2" required step="any"
                       value="${param.num2 != null ? param.num2 : ''}">
            </div>
            
            <button type="submit">Calculate</button>
        </form>
        
        <%
            if (request.getMethod().equals("POST")) {
                try {
                    Calculator calc = new Calculator();
                    double num1 = Double.parseDouble(request.getParameter("num1"));
                    double num2 = Double.parseDouble(request.getParameter("num2"));
                    String operation = request.getParameter("operation");
                    double result = 0;
                    String operationSymbol = "";
                    
                    switch(operation) {
                        case "add":
                            result = calc.add((int)num1, (int)num2);
                            operationSymbol = "+";
                            break;
                        case "subtract":
                            result = calc.subtract((int)num1, (int)num2);
                            operationSymbol = "-";
                            break;
                        case "multiply":
                            result = calc.multiply((int)num1, (int)num2);
                            operationSymbol = "×";
                            break;
                        case "divide":
                            result = calc.divide((int)num1, (int)num2);
                            operationSymbol = "÷";
                            break;
                    }
        %>
                    <div class="result">
                        <h3>Result:</h3>
                        <p><%= num1 %> <%= operationSymbol %> <%= num2 %> = <%= result %></p>
                    </div>
        <%
                } catch (Exception e) {
        %>
                    <div class="result" style="color: red;">
                        <p>Error: <%= e.getMessage() %></p>
                    </div>
        <%
                }
            }
        %>
    </div>
</body>
</html>