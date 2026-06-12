# OpenCppCoverage is an open source code coverage for C++.
# Copyright (C) 2014 OpenCppCoverage
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http:#www.gnu.org/licenses/>.

FROM mcr.microsoft.com/windows/servercore:ltsc2019

LABEL maintainer="chihawissem08@gmail.com"

RUN dism.exe /online /enable-feature /all /featurename:iis-webserver /NoRestart