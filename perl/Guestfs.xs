/* libguestfs generated file
 * WARNING: THIS FILE IS GENERATED BY 'src/generator.ml'.
 * ANY CHANGES YOU MAKE TO THIS FILE WILL BE LOST.
 *
 * Copyright (C) 2009 Red Hat Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <guestfs.h>

#ifndef PRId64
#define PRId64 "lld"
#endif

static SV *
my_newSVll(long long val) {
#ifdef USE_64_BIT_ALL
  return newSViv(val);
#else
  char buf[100];
  int len;
  len = snprintf(buf, 100, "%" PRId64, val);
  return newSVpv(buf, len);
#endif
}

#ifndef PRIu64
#define PRIu64 "llu"
#endif

static SV *
my_newSVull(unsigned long long val) {
#ifdef USE_64_BIT_ALL
  return newSVuv(val);
#else
  char buf[100];
  int len;
  len = snprintf(buf, 100, "%" PRIu64, val);
  return newSVpv(buf, len);
#endif
}

/* http://www.perlmonks.org/?node_id=680842 */
static char **
XS_unpack_charPtrPtr (SV *arg) {
  char **ret;
  AV *av;
  I32 i;

  if (!arg || !SvOK (arg) || !SvROK (arg) || SvTYPE (SvRV (arg)) != SVt_PVAV) {
    croak ("array reference expected");
  }

  av = (AV *)SvRV (arg);
  ret = (char **)malloc (av_len (av) + 1 + 1);

  for (i = 0; i <= av_len (av); i++) {
    SV **elem = av_fetch (av, i, 0);

    if (!elem || !*elem)
      croak ("missing element in list");

    ret[i] = SvPV_nolen (*elem);
  }

  ret[i] = NULL;

  return ret;
}

MODULE = Sys::Guestfs  PACKAGE = Sys::Guestfs

guestfs_h *
_create ()
   CODE:
      RETVAL = guestfs_create ();
      if (!RETVAL)
        croak ("could not create guestfs handle");
      guestfs_set_error_handler (RETVAL, NULL, NULL);
 OUTPUT:
      RETVAL

void
DESTROY (g)
      guestfs_h *g;
 PPCODE:
      guestfs_close (g);

void
launch (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_launch (g);
      if (r == -1)
        croak ("launch: %s", guestfs_last_error (g));

void
wait_ready (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_wait_ready (g);
      if (r == -1)
        croak ("wait_ready: %s", guestfs_last_error (g));

void
kill_subprocess (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_kill_subprocess (g);
      if (r == -1)
        croak ("kill_subprocess: %s", guestfs_last_error (g));

void
add_drive (g, filename)
      guestfs_h *g;
      char *filename;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_add_drive (g, filename);
      if (r == -1)
        croak ("add_drive: %s", guestfs_last_error (g));

void
add_cdrom (g, filename)
      guestfs_h *g;
      char *filename;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_add_cdrom (g, filename);
      if (r == -1)
        croak ("add_cdrom: %s", guestfs_last_error (g));

void
config (g, qemuparam, qemuvalue)
      guestfs_h *g;
      char *qemuparam;
      char *qemuvalue;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_config (g, qemuparam, qemuvalue);
      if (r == -1)
        croak ("config: %s", guestfs_last_error (g));

void
set_path (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_set_path (g, path);
      if (r == -1)
        croak ("set_path: %s", guestfs_last_error (g));

SV *
get_path (g)
      guestfs_h *g;
PREINIT:
      const char *path;
   CODE:
      path = guestfs_get_path (g);
      if (path == NULL)
        croak ("get_path: %s", guestfs_last_error (g));
      RETVAL = newSVpv (path, 0);
 OUTPUT:
      RETVAL

void
set_autosync (g, autosync)
      guestfs_h *g;
      int autosync;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_set_autosync (g, autosync);
      if (r == -1)
        croak ("set_autosync: %s", guestfs_last_error (g));

SV *
get_autosync (g)
      guestfs_h *g;
PREINIT:
      int autosync;
   CODE:
      autosync = guestfs_get_autosync (g);
      if (autosync == -1)
        croak ("get_autosync: %s", guestfs_last_error (g));
      RETVAL = newSViv (autosync);
 OUTPUT:
      RETVAL

void
set_verbose (g, verbose)
      guestfs_h *g;
      int verbose;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_set_verbose (g, verbose);
      if (r == -1)
        croak ("set_verbose: %s", guestfs_last_error (g));

SV *
get_verbose (g)
      guestfs_h *g;
PREINIT:
      int verbose;
   CODE:
      verbose = guestfs_get_verbose (g);
      if (verbose == -1)
        croak ("get_verbose: %s", guestfs_last_error (g));
      RETVAL = newSViv (verbose);
 OUTPUT:
      RETVAL

SV *
is_ready (g)
      guestfs_h *g;
PREINIT:
      int ready;
   CODE:
      ready = guestfs_is_ready (g);
      if (ready == -1)
        croak ("is_ready: %s", guestfs_last_error (g));
      RETVAL = newSViv (ready);
 OUTPUT:
      RETVAL

SV *
is_config (g)
      guestfs_h *g;
PREINIT:
      int config;
   CODE:
      config = guestfs_is_config (g);
      if (config == -1)
        croak ("is_config: %s", guestfs_last_error (g));
      RETVAL = newSViv (config);
 OUTPUT:
      RETVAL

SV *
is_launching (g)
      guestfs_h *g;
PREINIT:
      int launching;
   CODE:
      launching = guestfs_is_launching (g);
      if (launching == -1)
        croak ("is_launching: %s", guestfs_last_error (g));
      RETVAL = newSViv (launching);
 OUTPUT:
      RETVAL

SV *
is_busy (g)
      guestfs_h *g;
PREINIT:
      int busy;
   CODE:
      busy = guestfs_is_busy (g);
      if (busy == -1)
        croak ("is_busy: %s", guestfs_last_error (g));
      RETVAL = newSViv (busy);
 OUTPUT:
      RETVAL

SV *
get_state (g)
      guestfs_h *g;
PREINIT:
      int state;
   CODE:
      state = guestfs_get_state (g);
      if (state == -1)
        croak ("get_state: %s", guestfs_last_error (g));
      RETVAL = newSViv (state);
 OUTPUT:
      RETVAL

void
set_busy (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_set_busy (g);
      if (r == -1)
        croak ("set_busy: %s", guestfs_last_error (g));

void
set_ready (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_set_ready (g);
      if (r == -1)
        croak ("set_ready: %s", guestfs_last_error (g));

void
mount (g, device, mountpoint)
      guestfs_h *g;
      char *device;
      char *mountpoint;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_mount (g, device, mountpoint);
      if (r == -1)
        croak ("mount: %s", guestfs_last_error (g));

void
sync (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_sync (g);
      if (r == -1)
        croak ("sync: %s", guestfs_last_error (g));

void
touch (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_touch (g, path);
      if (r == -1)
        croak ("touch: %s", guestfs_last_error (g));

SV *
cat (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      char *content;
   CODE:
      content = guestfs_cat (g, path);
      if (content == NULL)
        croak ("cat: %s", guestfs_last_error (g));
      RETVAL = newSVpv (content, 0);
      free (content);
 OUTPUT:
      RETVAL

SV *
ll (g, directory)
      guestfs_h *g;
      char *directory;
PREINIT:
      char *listing;
   CODE:
      listing = guestfs_ll (g, directory);
      if (listing == NULL)
        croak ("ll: %s", guestfs_last_error (g));
      RETVAL = newSVpv (listing, 0);
      free (listing);
 OUTPUT:
      RETVAL

void
ls (g, directory)
      guestfs_h *g;
      char *directory;
PREINIT:
      char **listing;
      int i, n;
 PPCODE:
      listing = guestfs_ls (g, directory);
      if (listing == NULL)
        croak ("ls: %s", guestfs_last_error (g));
      for (n = 0; listing[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (listing[i], 0)));
        free (listing[i]);
      }
      free (listing);

void
list_devices (g)
      guestfs_h *g;
PREINIT:
      char **devices;
      int i, n;
 PPCODE:
      devices = guestfs_list_devices (g);
      if (devices == NULL)
        croak ("list_devices: %s", guestfs_last_error (g));
      for (n = 0; devices[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (devices[i], 0)));
        free (devices[i]);
      }
      free (devices);

void
list_partitions (g)
      guestfs_h *g;
PREINIT:
      char **partitions;
      int i, n;
 PPCODE:
      partitions = guestfs_list_partitions (g);
      if (partitions == NULL)
        croak ("list_partitions: %s", guestfs_last_error (g));
      for (n = 0; partitions[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (partitions[i], 0)));
        free (partitions[i]);
      }
      free (partitions);

void
pvs (g)
      guestfs_h *g;
PREINIT:
      char **physvols;
      int i, n;
 PPCODE:
      physvols = guestfs_pvs (g);
      if (physvols == NULL)
        croak ("pvs: %s", guestfs_last_error (g));
      for (n = 0; physvols[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (physvols[i], 0)));
        free (physvols[i]);
      }
      free (physvols);

void
vgs (g)
      guestfs_h *g;
PREINIT:
      char **volgroups;
      int i, n;
 PPCODE:
      volgroups = guestfs_vgs (g);
      if (volgroups == NULL)
        croak ("vgs: %s", guestfs_last_error (g));
      for (n = 0; volgroups[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (volgroups[i], 0)));
        free (volgroups[i]);
      }
      free (volgroups);

void
lvs (g)
      guestfs_h *g;
PREINIT:
      char **logvols;
      int i, n;
 PPCODE:
      logvols = guestfs_lvs (g);
      if (logvols == NULL)
        croak ("lvs: %s", guestfs_last_error (g));
      for (n = 0; logvols[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (logvols[i], 0)));
        free (logvols[i]);
      }
      free (logvols);

void
pvs_full (g)
      guestfs_h *g;
PREINIT:
      struct guestfs_lvm_pv_list *physvols;
      int i;
      HV *hv;
 PPCODE:
      physvols = guestfs_pvs_full (g);
      if (physvols == NULL)
        croak ("pvs_full: %s", guestfs_last_error (g));
      EXTEND (SP, physvols->len);
      for (i = 0; i < physvols->len; ++i) {
        hv = newHV ();
        (void) hv_store (hv, "pv_name", 7, newSVpv (physvols->val[i].pv_name, 0), 0);
        (void) hv_store (hv, "pv_uuid", 7, newSVpv (physvols->val[i].pv_uuid, 32), 0);
        (void) hv_store (hv, "pv_fmt", 6, newSVpv (physvols->val[i].pv_fmt, 0), 0);
        (void) hv_store (hv, "pv_size", 7, my_newSVull (physvols->val[i].pv_size), 0);
        (void) hv_store (hv, "dev_size", 8, my_newSVull (physvols->val[i].dev_size), 0);
        (void) hv_store (hv, "pv_free", 7, my_newSVull (physvols->val[i].pv_free), 0);
        (void) hv_store (hv, "pv_used", 7, my_newSVull (physvols->val[i].pv_used), 0);
        (void) hv_store (hv, "pv_attr", 7, newSVpv (physvols->val[i].pv_attr, 0), 0);
        (void) hv_store (hv, "pv_pe_count", 11, my_newSVll (physvols->val[i].pv_pe_count), 0);
        (void) hv_store (hv, "pv_pe_alloc_count", 17, my_newSVll (physvols->val[i].pv_pe_alloc_count), 0);
        (void) hv_store (hv, "pv_tags", 7, newSVpv (physvols->val[i].pv_tags, 0), 0);
        (void) hv_store (hv, "pe_start", 8, my_newSVull (physvols->val[i].pe_start), 0);
        (void) hv_store (hv, "pv_mda_count", 12, my_newSVll (physvols->val[i].pv_mda_count), 0);
        (void) hv_store (hv, "pv_mda_free", 11, my_newSVull (physvols->val[i].pv_mda_free), 0);
        PUSHs (sv_2mortal ((SV *) hv));
      }
      guestfs_free_lvm_pv_list (physvols);

void
vgs_full (g)
      guestfs_h *g;
PREINIT:
      struct guestfs_lvm_vg_list *volgroups;
      int i;
      HV *hv;
 PPCODE:
      volgroups = guestfs_vgs_full (g);
      if (volgroups == NULL)
        croak ("vgs_full: %s", guestfs_last_error (g));
      EXTEND (SP, volgroups->len);
      for (i = 0; i < volgroups->len; ++i) {
        hv = newHV ();
        (void) hv_store (hv, "vg_name", 7, newSVpv (volgroups->val[i].vg_name, 0), 0);
        (void) hv_store (hv, "vg_uuid", 7, newSVpv (volgroups->val[i].vg_uuid, 32), 0);
        (void) hv_store (hv, "vg_fmt", 6, newSVpv (volgroups->val[i].vg_fmt, 0), 0);
        (void) hv_store (hv, "vg_attr", 7, newSVpv (volgroups->val[i].vg_attr, 0), 0);
        (void) hv_store (hv, "vg_size", 7, my_newSVull (volgroups->val[i].vg_size), 0);
        (void) hv_store (hv, "vg_free", 7, my_newSVull (volgroups->val[i].vg_free), 0);
        (void) hv_store (hv, "vg_sysid", 8, newSVpv (volgroups->val[i].vg_sysid, 0), 0);
        (void) hv_store (hv, "vg_extent_size", 14, my_newSVull (volgroups->val[i].vg_extent_size), 0);
        (void) hv_store (hv, "vg_extent_count", 15, my_newSVll (volgroups->val[i].vg_extent_count), 0);
        (void) hv_store (hv, "vg_free_count", 13, my_newSVll (volgroups->val[i].vg_free_count), 0);
        (void) hv_store (hv, "max_lv", 6, my_newSVll (volgroups->val[i].max_lv), 0);
        (void) hv_store (hv, "max_pv", 6, my_newSVll (volgroups->val[i].max_pv), 0);
        (void) hv_store (hv, "pv_count", 8, my_newSVll (volgroups->val[i].pv_count), 0);
        (void) hv_store (hv, "lv_count", 8, my_newSVll (volgroups->val[i].lv_count), 0);
        (void) hv_store (hv, "snap_count", 10, my_newSVll (volgroups->val[i].snap_count), 0);
        (void) hv_store (hv, "vg_seqno", 8, my_newSVll (volgroups->val[i].vg_seqno), 0);
        (void) hv_store (hv, "vg_tags", 7, newSVpv (volgroups->val[i].vg_tags, 0), 0);
        (void) hv_store (hv, "vg_mda_count", 12, my_newSVll (volgroups->val[i].vg_mda_count), 0);
        (void) hv_store (hv, "vg_mda_free", 11, my_newSVull (volgroups->val[i].vg_mda_free), 0);
        PUSHs (sv_2mortal ((SV *) hv));
      }
      guestfs_free_lvm_vg_list (volgroups);

void
lvs_full (g)
      guestfs_h *g;
PREINIT:
      struct guestfs_lvm_lv_list *logvols;
      int i;
      HV *hv;
 PPCODE:
      logvols = guestfs_lvs_full (g);
      if (logvols == NULL)
        croak ("lvs_full: %s", guestfs_last_error (g));
      EXTEND (SP, logvols->len);
      for (i = 0; i < logvols->len; ++i) {
        hv = newHV ();
        (void) hv_store (hv, "lv_name", 7, newSVpv (logvols->val[i].lv_name, 0), 0);
        (void) hv_store (hv, "lv_uuid", 7, newSVpv (logvols->val[i].lv_uuid, 32), 0);
        (void) hv_store (hv, "lv_attr", 7, newSVpv (logvols->val[i].lv_attr, 0), 0);
        (void) hv_store (hv, "lv_major", 8, my_newSVll (logvols->val[i].lv_major), 0);
        (void) hv_store (hv, "lv_minor", 8, my_newSVll (logvols->val[i].lv_minor), 0);
        (void) hv_store (hv, "lv_kernel_major", 15, my_newSVll (logvols->val[i].lv_kernel_major), 0);
        (void) hv_store (hv, "lv_kernel_minor", 15, my_newSVll (logvols->val[i].lv_kernel_minor), 0);
        (void) hv_store (hv, "lv_size", 7, my_newSVull (logvols->val[i].lv_size), 0);
        (void) hv_store (hv, "seg_count", 9, my_newSVll (logvols->val[i].seg_count), 0);
        (void) hv_store (hv, "origin", 6, newSVpv (logvols->val[i].origin, 0), 0);
        (void) hv_store (hv, "snap_percent", 12, newSVnv (logvols->val[i].snap_percent), 0);
        (void) hv_store (hv, "copy_percent", 12, newSVnv (logvols->val[i].copy_percent), 0);
        (void) hv_store (hv, "move_pv", 7, newSVpv (logvols->val[i].move_pv, 0), 0);
        (void) hv_store (hv, "lv_tags", 7, newSVpv (logvols->val[i].lv_tags, 0), 0);
        (void) hv_store (hv, "mirror_log", 10, newSVpv (logvols->val[i].mirror_log, 0), 0);
        (void) hv_store (hv, "modules", 7, newSVpv (logvols->val[i].modules, 0), 0);
        PUSHs (sv_2mortal ((SV *) hv));
      }
      guestfs_free_lvm_lv_list (logvols);

void
read_lines (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      char **lines;
      int i, n;
 PPCODE:
      lines = guestfs_read_lines (g, path);
      if (lines == NULL)
        croak ("read_lines: %s", guestfs_last_error (g));
      for (n = 0; lines[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (lines[i], 0)));
        free (lines[i]);
      }
      free (lines);

void
aug_init (g, root, flags)
      guestfs_h *g;
      char *root;
      int flags;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_aug_init (g, root, flags);
      if (r == -1)
        croak ("aug_init: %s", guestfs_last_error (g));

void
aug_close (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_aug_close (g);
      if (r == -1)
        croak ("aug_close: %s", guestfs_last_error (g));

SV *
aug_defvar (g, name, expr)
      guestfs_h *g;
      char *name;
      char *expr;
PREINIT:
      int nrnodes;
   CODE:
      nrnodes = guestfs_aug_defvar (g, name, expr);
      if (nrnodes == -1)
        croak ("aug_defvar: %s", guestfs_last_error (g));
      RETVAL = newSViv (nrnodes);
 OUTPUT:
      RETVAL

void
aug_defnode (g, name, expr, val)
      guestfs_h *g;
      char *name;
      char *expr;
      char *val;
PREINIT:
      struct guestfs_int_bool *r;
 PPCODE:
      r = guestfs_aug_defnode (g, name, expr, val);
      if (r == NULL)
        croak ("aug_defnode: %s", guestfs_last_error (g));
      EXTEND (SP, 2);
      PUSHs (sv_2mortal (newSViv (r->i)));
      PUSHs (sv_2mortal (newSViv (r->b)));
      guestfs_free_int_bool (r);

SV *
aug_get (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      char *val;
   CODE:
      val = guestfs_aug_get (g, path);
      if (val == NULL)
        croak ("aug_get: %s", guestfs_last_error (g));
      RETVAL = newSVpv (val, 0);
      free (val);
 OUTPUT:
      RETVAL

void
aug_set (g, path, val)
      guestfs_h *g;
      char *path;
      char *val;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_aug_set (g, path, val);
      if (r == -1)
        croak ("aug_set: %s", guestfs_last_error (g));

void
aug_insert (g, path, label, before)
      guestfs_h *g;
      char *path;
      char *label;
      int before;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_aug_insert (g, path, label, before);
      if (r == -1)
        croak ("aug_insert: %s", guestfs_last_error (g));

SV *
aug_rm (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int nrnodes;
   CODE:
      nrnodes = guestfs_aug_rm (g, path);
      if (nrnodes == -1)
        croak ("aug_rm: %s", guestfs_last_error (g));
      RETVAL = newSViv (nrnodes);
 OUTPUT:
      RETVAL

void
aug_mv (g, src, dest)
      guestfs_h *g;
      char *src;
      char *dest;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_aug_mv (g, src, dest);
      if (r == -1)
        croak ("aug_mv: %s", guestfs_last_error (g));

void
aug_match (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      char **matches;
      int i, n;
 PPCODE:
      matches = guestfs_aug_match (g, path);
      if (matches == NULL)
        croak ("aug_match: %s", guestfs_last_error (g));
      for (n = 0; matches[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (matches[i], 0)));
        free (matches[i]);
      }
      free (matches);

void
aug_save (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_aug_save (g);
      if (r == -1)
        croak ("aug_save: %s", guestfs_last_error (g));

void
aug_load (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_aug_load (g);
      if (r == -1)
        croak ("aug_load: %s", guestfs_last_error (g));

void
aug_ls (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      char **matches;
      int i, n;
 PPCODE:
      matches = guestfs_aug_ls (g, path);
      if (matches == NULL)
        croak ("aug_ls: %s", guestfs_last_error (g));
      for (n = 0; matches[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (matches[i], 0)));
        free (matches[i]);
      }
      free (matches);

void
rm (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_rm (g, path);
      if (r == -1)
        croak ("rm: %s", guestfs_last_error (g));

void
rmdir (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_rmdir (g, path);
      if (r == -1)
        croak ("rmdir: %s", guestfs_last_error (g));

void
rm_rf (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_rm_rf (g, path);
      if (r == -1)
        croak ("rm_rf: %s", guestfs_last_error (g));

void
mkdir (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_mkdir (g, path);
      if (r == -1)
        croak ("mkdir: %s", guestfs_last_error (g));

void
mkdir_p (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_mkdir_p (g, path);
      if (r == -1)
        croak ("mkdir_p: %s", guestfs_last_error (g));

void
chmod (g, mode, path)
      guestfs_h *g;
      int mode;
      char *path;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_chmod (g, mode, path);
      if (r == -1)
        croak ("chmod: %s", guestfs_last_error (g));

void
chown (g, owner, group, path)
      guestfs_h *g;
      int owner;
      int group;
      char *path;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_chown (g, owner, group, path);
      if (r == -1)
        croak ("chown: %s", guestfs_last_error (g));

SV *
exists (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int existsflag;
   CODE:
      existsflag = guestfs_exists (g, path);
      if (existsflag == -1)
        croak ("exists: %s", guestfs_last_error (g));
      RETVAL = newSViv (existsflag);
 OUTPUT:
      RETVAL

SV *
is_file (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int fileflag;
   CODE:
      fileflag = guestfs_is_file (g, path);
      if (fileflag == -1)
        croak ("is_file: %s", guestfs_last_error (g));
      RETVAL = newSViv (fileflag);
 OUTPUT:
      RETVAL

SV *
is_dir (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      int dirflag;
   CODE:
      dirflag = guestfs_is_dir (g, path);
      if (dirflag == -1)
        croak ("is_dir: %s", guestfs_last_error (g));
      RETVAL = newSViv (dirflag);
 OUTPUT:
      RETVAL

void
pvcreate (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_pvcreate (g, device);
      if (r == -1)
        croak ("pvcreate: %s", guestfs_last_error (g));

void
vgcreate (g, volgroup, physvols)
      guestfs_h *g;
      char *volgroup;
      char **physvols;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_vgcreate (g, volgroup, physvols);
      free (physvols);
      if (r == -1)
        croak ("vgcreate: %s", guestfs_last_error (g));

void
lvcreate (g, logvol, volgroup, mbytes)
      guestfs_h *g;
      char *logvol;
      char *volgroup;
      int mbytes;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_lvcreate (g, logvol, volgroup, mbytes);
      if (r == -1)
        croak ("lvcreate: %s", guestfs_last_error (g));

void
mkfs (g, fstype, device)
      guestfs_h *g;
      char *fstype;
      char *device;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_mkfs (g, fstype, device);
      if (r == -1)
        croak ("mkfs: %s", guestfs_last_error (g));

void
sfdisk (g, device, cyls, heads, sectors, lines)
      guestfs_h *g;
      char *device;
      int cyls;
      int heads;
      int sectors;
      char **lines;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_sfdisk (g, device, cyls, heads, sectors, lines);
      free (lines);
      if (r == -1)
        croak ("sfdisk: %s", guestfs_last_error (g));

void
write_file (g, path, content, size)
      guestfs_h *g;
      char *path;
      char *content;
      int size;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_write_file (g, path, content, size);
      if (r == -1)
        croak ("write_file: %s", guestfs_last_error (g));

void
umount (g, pathordevice)
      guestfs_h *g;
      char *pathordevice;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_umount (g, pathordevice);
      if (r == -1)
        croak ("umount: %s", guestfs_last_error (g));

void
mounts (g)
      guestfs_h *g;
PREINIT:
      char **devices;
      int i, n;
 PPCODE:
      devices = guestfs_mounts (g);
      if (devices == NULL)
        croak ("mounts: %s", guestfs_last_error (g));
      for (n = 0; devices[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (devices[i], 0)));
        free (devices[i]);
      }
      free (devices);

void
umount_all (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_umount_all (g);
      if (r == -1)
        croak ("umount_all: %s", guestfs_last_error (g));

void
lvm_remove_all (g)
      guestfs_h *g;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_lvm_remove_all (g);
      if (r == -1)
        croak ("lvm_remove_all: %s", guestfs_last_error (g));

SV *
file (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      char *description;
   CODE:
      description = guestfs_file (g, path);
      if (description == NULL)
        croak ("file: %s", guestfs_last_error (g));
      RETVAL = newSVpv (description, 0);
      free (description);
 OUTPUT:
      RETVAL

SV *
command (g, arguments)
      guestfs_h *g;
      char **arguments;
PREINIT:
      char *output;
   CODE:
      output = guestfs_command (g, arguments);
      free (arguments);
      if (output == NULL)
        croak ("command: %s", guestfs_last_error (g));
      RETVAL = newSVpv (output, 0);
      free (output);
 OUTPUT:
      RETVAL

void
command_lines (g, arguments)
      guestfs_h *g;
      char **arguments;
PREINIT:
      char **lines;
      int i, n;
 PPCODE:
      lines = guestfs_command_lines (g, arguments);
      free (arguments);
      if (lines == NULL)
        croak ("command_lines: %s", guestfs_last_error (g));
      for (n = 0; lines[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (lines[i], 0)));
        free (lines[i]);
      }
      free (lines);

void
stat (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      struct guestfs_stat *statbuf;
 PPCODE:
      statbuf = guestfs_stat (g, path);
      if (statbuf == NULL)
        croak ("stat: %s", guestfs_last_error (g));
      EXTEND (SP, 13);
      PUSHs (sv_2mortal (my_newSVll (statbuf->dev)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->ino)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->mode)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->nlink)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->uid)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->gid)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->rdev)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->size)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->blksize)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->blocks)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->atime)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->mtime)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->ctime)));
      free (statbuf);

void
lstat (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      struct guestfs_stat *statbuf;
 PPCODE:
      statbuf = guestfs_lstat (g, path);
      if (statbuf == NULL)
        croak ("lstat: %s", guestfs_last_error (g));
      EXTEND (SP, 13);
      PUSHs (sv_2mortal (my_newSVll (statbuf->dev)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->ino)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->mode)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->nlink)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->uid)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->gid)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->rdev)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->size)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->blksize)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->blocks)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->atime)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->mtime)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->ctime)));
      free (statbuf);

void
statvfs (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      struct guestfs_statvfs *statbuf;
 PPCODE:
      statbuf = guestfs_statvfs (g, path);
      if (statbuf == NULL)
        croak ("statvfs: %s", guestfs_last_error (g));
      EXTEND (SP, 11);
      PUSHs (sv_2mortal (my_newSVll (statbuf->bsize)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->frsize)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->blocks)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->bfree)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->bavail)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->files)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->ffree)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->favail)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->fsid)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->flag)));
      PUSHs (sv_2mortal (my_newSVll (statbuf->namemax)));
      free (statbuf);

void
tune2fs_l (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      char **superblock;
      int i, n;
 PPCODE:
      superblock = guestfs_tune2fs_l (g, device);
      if (superblock == NULL)
        croak ("tune2fs_l: %s", guestfs_last_error (g));
      for (n = 0; superblock[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (superblock[i], 0)));
        free (superblock[i]);
      }
      free (superblock);

void
blockdev_setro (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_blockdev_setro (g, device);
      if (r == -1)
        croak ("blockdev_setro: %s", guestfs_last_error (g));

void
blockdev_setrw (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_blockdev_setrw (g, device);
      if (r == -1)
        croak ("blockdev_setrw: %s", guestfs_last_error (g));

SV *
blockdev_getro (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int ro;
   CODE:
      ro = guestfs_blockdev_getro (g, device);
      if (ro == -1)
        croak ("blockdev_getro: %s", guestfs_last_error (g));
      RETVAL = newSViv (ro);
 OUTPUT:
      RETVAL

SV *
blockdev_getss (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int sectorsize;
   CODE:
      sectorsize = guestfs_blockdev_getss (g, device);
      if (sectorsize == -1)
        croak ("blockdev_getss: %s", guestfs_last_error (g));
      RETVAL = newSViv (sectorsize);
 OUTPUT:
      RETVAL

SV *
blockdev_getbsz (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int blocksize;
   CODE:
      blocksize = guestfs_blockdev_getbsz (g, device);
      if (blocksize == -1)
        croak ("blockdev_getbsz: %s", guestfs_last_error (g));
      RETVAL = newSViv (blocksize);
 OUTPUT:
      RETVAL

void
blockdev_setbsz (g, device, blocksize)
      guestfs_h *g;
      char *device;
      int blocksize;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_blockdev_setbsz (g, device, blocksize);
      if (r == -1)
        croak ("blockdev_setbsz: %s", guestfs_last_error (g));

SV *
blockdev_getsz (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int64_t sizeinsectors;
   CODE:
      sizeinsectors = guestfs_blockdev_getsz (g, device);
      if (sizeinsectors == -1)
        croak ("blockdev_getsz: %s", guestfs_last_error (g));
      RETVAL = my_newSVll (sizeinsectors);
 OUTPUT:
      RETVAL

SV *
blockdev_getsize64 (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int64_t sizeinbytes;
   CODE:
      sizeinbytes = guestfs_blockdev_getsize64 (g, device);
      if (sizeinbytes == -1)
        croak ("blockdev_getsize64: %s", guestfs_last_error (g));
      RETVAL = my_newSVll (sizeinbytes);
 OUTPUT:
      RETVAL

void
blockdev_flushbufs (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_blockdev_flushbufs (g, device);
      if (r == -1)
        croak ("blockdev_flushbufs: %s", guestfs_last_error (g));

void
blockdev_rereadpt (g, device)
      guestfs_h *g;
      char *device;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_blockdev_rereadpt (g, device);
      if (r == -1)
        croak ("blockdev_rereadpt: %s", guestfs_last_error (g));

void
upload (g, filename, remotefilename)
      guestfs_h *g;
      char *filename;
      char *remotefilename;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_upload (g, filename, remotefilename);
      if (r == -1)
        croak ("upload: %s", guestfs_last_error (g));

void
download (g, remotefilename, filename)
      guestfs_h *g;
      char *remotefilename;
      char *filename;
PREINIT:
      int r;
 PPCODE:
      r = guestfs_download (g, remotefilename, filename);
      if (r == -1)
        croak ("download: %s", guestfs_last_error (g));

