FROM odoo:16

RUN pip3 install -r requirements.txt

COPY custom_folder/* /usr/local/bin/

ENTRYPOINT ["/entrypoint.sh"]
