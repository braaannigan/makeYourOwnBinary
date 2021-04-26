# syntax=docker/dockerfile:experimental
FROM julia:1.6-buster
WORKDIR /usr/src/app
# RUN echo 'alias tst="python -m pytest regex_matching/src"' >> ~/.bashrc
# RUN echo 'alias dtst="python -m pytest regex_matching/src --pdb"' >> ~/.bashrc
# RUN echo 'alias jlab="jupyter lab --allow-root --ip 0.0.0.0 --no-browser"' >> ~/.bashrc
# # RUN echo 'alias app="streamlit run regex_matching/src.viz/clusters.py"' >> ~/.bashrc
COPY build.jl .
COPY MyJuliaProject .
# RUN pip install --upgrade pip
# RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt
RUN julia build.jl