<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <!-- Turkish Version -->
    <h1>inception</h1>
    <h2>Proje Hakkında</h2>
    <p><strong>inception</strong> projesi, Ecole 42'nin bir parçası olarak geliştirilmiş bir sanal makine ve konteyner yönetim projesidir. Bu proje, kullanıcıların Docker kullanarak çeşitli hizmetleri (web sunucusu, veritabanı vb.) sanal makineler ve konteynerlerde çalıştırmasını sağlar.</p>
    <h2>Özellikler</h2>
    <ul>
        <li>Docker ve Docker-compose kullanımı</li>
        <li>Çoklu hizmet (web sunucusu, veritabanı, vb.) yönetimi</li>
        <li>Konteynerleştirilmiş uygulama dağıtımı</li>
        <li>Sanallaştırma teknikleri</li>
    </ul>
    <h2>Kurulum</h2>
    <h3>Gereksinimler</h3>
    <ul>
        <li>Docker</li>
        <li>Docker-compose</li>
        <li>Makefile (isteğe bağlı)</li>
    </ul>
    <h3>Adımlar</h3>
    <ol>
        <li><strong>Depoyu Klonlayın:</strong>
            <pre><code>git clone https://github.com/eryilmaz1337/inception.git
cd inception</code></pre>
        </li>
        <li><strong>Docker Konteynerlerini Başlatın:</strong>
            <pre><code>docker-compose up --build</code></pre>
        </li>
        <p>yada direk make komutunu kullanarakta projeyi çalıştırabilirsiniz</p>
        <li><strong>Hizmetlerin Çalıştığını Doğrulayın:</strong>
            <p>Tarayıcınızda yerel sunucu adresini ziyaret ederek web hizmetlerinin çalıştığını doğrulayabilirsiniz.</p>
        </li>
    </ol>
    <h2>Kullanım</h2>
    <ol>
        <li><strong>Docker-compose ile Hizmetleri Yönetin:</strong>
            <p>Hizmetleri başlatmak, durdurmak veya yeniden başlatmak için Docker-compose komutlarını kullanabilirsiniz.</p>
        </li>
        <li><strong>Konfigürasyon Dosyalarını Düzenleyin:</strong>
            <p>Docker-compose ve diğer yapılandırma dosyalarını düzenleyerek hizmetlerinizi özelleştirebilirsiniz.</p>
        </li>
        <li><strong>Logları İnceleyin:</strong>
            <p>Docker konteynerlerinin loglarını inceleyerek hizmetlerin durumu hakkında bilgi edinebilirsiniz.</p>
        </li>
    </ol>
    <!-- English Version -->
    <h1>inception</h1>
    <h2>About the Project</h2>
    <p>The <strong>inception</strong> project is a virtualization and container management project developed as part of Ecole 42. This project enables users to run various services (web server, database, etc.) in virtual machines and containers using Docker.</p>
    <h2>Features</h2>
    <ul>
        <li>Usage of Docker and Docker-compose</li>
        <li>Management of multiple services (web server, database, etc.)</li>
        <li>Deployment of containerized applications</li>
        <li>Virtualization techniques</li>
    </ul>
    <h2>Setup</h2>
    <h3>Requirements</h3>
    <ul>
        <li>Docker</li>
        <li>Docker-compose</li>
        <li>Makefile (optional)</li>
    </ul>
    <h3>Steps</h3>
    <ol>
        <li><strong>Clone the Repository:</strong>
            <pre><code>git clone https://github.com/eryilmaz1337/inception.git
cd inception</code></pre>
        </li>
        <li><strong>Start the Docker Containers:</strong>
            <pre><code>docker-compose up --build</code></pre>
        </li>
        <li><strong>Verify the Services are Running:</strong>
            <p>Visit the local server address in your browser to verify that the web services are running.</p>
        </li>
    </ol>
    <h2>Usage</h2>
    <ol>
        <li><strong>Manage Services with Docker-compose:</strong>
            <p>Use Docker-compose commands to start, stop, or restart services.</p>
        </li>
        <li><strong>Edit Configuration Files:</strong>
            <p>Customize your services by editing the Docker-compose and other configuration files.</p>
        </li>
        <li><strong>Check Logs:</strong>
            <p>Review the logs of Docker containers to get information about the status of services.</p>
        </li>
    </ol>
</body>
</html>
