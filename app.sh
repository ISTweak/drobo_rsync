### RSYNC ###
_build_rsync() {
local VERSION="3.1.3"
local FOLDER="rsync-${VERSION}"
local FILE="${FOLDER}.tar.gz"
local URL="https://rsync.samba.org/ftp/rsync/src/${FILE}"

_download_tgz "${FILE}" "${URL}" "${FOLDER}"
pushd "target/${FOLDER}"
rsync_cv_HAVE_SECURE_MKSTEMP=yes ./configure --host="${HOST}" --prefix="${DEST}" --with-rsyncd-conf="${DEST}/etc/rsyncd.conf" --with-nobody-group=nobody

make
make install
popd
}

### BUILD ###
_build() {
  _build_rsync
  _package
}

