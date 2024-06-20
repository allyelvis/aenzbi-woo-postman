#!/bin/bash

# Project name
PROJECT_NAME="aenzbi-woo-postman"

# Create project directories
echo "Creating project directories..."
mkdir -p $PROJECT_NAME/{app/{static,templates,models,scripts},modules,deployments}

# Navigate to project directory
cd $PROJECT_NAME

# Initialize a Git repository
echo "Initializing Git repository..."
git init

# Create a virtual environment
echo "Creating virtual environment..."
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install Flask and WooCommerce API client
echo "Installing Flask and WooCommerce API client..."
pip install Flask woocommerce

# Create requirements.txt
echo "Creating requirements.txt..."
pip freeze > requirements.txt

# Create a basic Flask application
echo "Creating basic Flask application..."

cat <<EOF > app/__init__.py
from flask import Flask

def create_app():
    app = Flask(__name__)

    from . import main
    app.register_blueprint(main.bp)

    return app
EOF

cat <<EOF > app/main.py
from flask import Blueprint, render_template
from woocommerce import API

bp = Blueprint('main', __name__)

# Configure WooCommerce API
wcapi = API(
    url="https://aenzbi.bi/wp",
    consumer_key="your_consumer_key",
    consumer_secret="your_consumer_secret",
    version="wc/v3"
)

@bp.route('/')
def index():
    # Fetch products from WooCommerce
    products = wcapi.get("products").json()
    return render_template('index.html', products=products)

@bp.route('/product/<int:product_id>')
def product_detail(product_id):
    # Fetch single product details from WooCommerce
    product = wcapi.get(f"products/{product_id}").json()
    return render_template('product_detail.html', product=product)
EOF

cat <<EOF > app/templates/index.html
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>WooCommerce Products</title>
</head>
<body>
    <h1>WooCommerce Products</h1>
    <ul>
    {% for product in products %}
        <li><a href="/product/{{ product.id }}">{{ product.name }}</a></li>
    {% endfor %}
    </ul>
</body>
</html>
EOF

cat <<EOF > app/templates/product_detail.html
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{ product.name }}</title>
</head>
<body>
    <h1>{{ product.name }}</h1>
    <p>{{ product.description | safe }}</p>
    <p>Price: {{ product.price }}</p>
    <a href="/">Back to products</a>
</body>
</html>
EOF

# Create a run script
echo "Creating run script..."

cat <<EOF > run.py
from app import create_app

app = create_app()

if __name__ == '__main__':
    app.run(debug=True)
EOF

# Create a Dockerfile
echo "Creating Dockerfile..."

cat <<EOF > Dockerfile
# Use the official Python image from the Docker Hub
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME AENZBi

# Run app.py when the container launches
CMD ["python", "run.py"]
EOF

# Create a .dockerignore file
echo "Creating .dockerignore..."

cat <<EOF > .dockerignore
venv
__pycache__
*.pyc
*.pyo
*.pyd
.Python
build
develop-eggs
dist
downloads
eggs
lib
lib64
parts
sdist
var
*.log
*.pot
*.pyc
instance
.webassets-cache
.coverage
*.egg-info
.installed.cfg
*.egg
.cache
.pytest_cache
.tox
EOF

# Create a README file
echo "Creating README.md..."

cat <<EOF > README.md
# AENZBi WooCommerce Postman Integration

This is a Flask web application integrated with the WooCommerce API for the aenzbi WooCommerce store.

## Setup

1. **Clone the repository**:
    \`\`\`sh
    git clone <repository_url>
    cd $PROJECT_NAME
    \`\`\`

2. **Create a virtual environment and activate it**:
    \`\`\`sh
    python3 -m venv venv
    source venv/bin/activate
    \`\`\`

3. **Install dependencies**:
    \`\`\`sh
    pip install -r requirements.txt
    \`\`\`

4. **Set up WooCommerce API credentials**:
    - Open \`app/main.py\`.
    - Replace \`your_consumer_key\` and \`your_consumer_secret\` with your actual WooCommerce API credentials.

5. **Run the application**:
    \`\`\`sh
    python run.py
    \`\`\`

## Deployment with Docker

1. **Build the Docker image**:
    \`\`\`sh
    docker build -t $PROJECT_NAME .
    \`\`\`

2. **Run the Docker container**:
    \`\`\`sh
    docker run -p 5000:5000 $PROJECT_NAME
    \`\`\`

Your Flask app should now be running on \`http://localhost:5000\`.

## WooCommerce API Usage

- The homepage fetches and displays a list of products from the WooCommerce store.
- Clicking on a product name navigates to a detailed view of the product.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
EOF

# Deactivate the virtual environment
deactivate

# Initialize a new git repository
echo "Adding files to git and making initial commit..."
git add .
git commit -m "Initial commit"

echo "Project setup is complete!"
