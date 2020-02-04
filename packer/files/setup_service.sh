#!/bin/bash

echo "[Service]
Type=simple
User=appuser
Group=appuser
WorkingDirectory=/home/appuser/reddit/
ExecStart=/usr/bin/bundle exec puma

[Install]
WantedBy=multi-user.target
" >> $HOME/puma.service

cp $HOME/puma.service /lib/systemd/system/puma.service

sudo systemctl start puma
sudo systemctl enable puma
